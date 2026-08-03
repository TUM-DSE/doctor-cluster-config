// AWS SigV4 request signing for proxying to S3.
//
// Exposes two nginx variables that can be passed upstream with
// proxy_set_header:
//
//   $s3v4_authorization - "AWS4-HMAC-SHA256 Credential=..." header value
//   $s3v4_amz_date      - matching x-amz-date timestamp
//
// The signature covers the headers host, x-amz-content-sha256 (fixed to
// UNSIGNED-PAYLOAD) and x-amz-date, so the proxy configuration must set
// exactly these headers on the upstream request.
//
// Configuration directives (http/server/location):
//
//   s3_auth_access_key_file <path>;
//   s3_auth_secret_key_file <path>;
//   s3_auth_host <bucket host, e.g. bucket.s3.example.com>;
//   s3_auth_region <region>;  # default: us-east-1

use core::ffi::{c_char, c_void};
use core::ptr::{self, NonNull};

use ngx::core::{Pool, Status};
use ngx::ffi::{
    NGX_CONF_TAKE1, NGX_HTTP_LOC_CONF, NGX_HTTP_LOC_CONF_OFFSET, NGX_HTTP_MAIN_CONF,
    NGX_HTTP_MODULE, NGX_HTTP_SRV_CONF, NGX_LOG_EMERG, ngx_command_t, ngx_conf_t,
    ngx_http_add_variable, ngx_http_module_t, ngx_http_variable_t, ngx_int_t, ngx_module_t,
    ngx_str_t, ngx_uint_t, ngx_variable_value_t,
};
use ngx::http::{self, HttpModule, HttpModuleLocationConf, Merge, MergeConfigError};
use ngx::{http_variable_get, ngx_conf_log_error, ngx_log_debug_http, ngx_string};
use s3_sigv4::SigningParams;

struct Module;

impl HttpModule for Module {
    fn module() -> &'static ngx_module_t {
        unsafe { &*::core::ptr::addr_of!(ngx_http_s3_auth_module) }
    }

    unsafe extern "C" fn preconfiguration(cf: *mut ngx_conf_t) -> ngx_int_t {
        for mut v in unsafe { NGX_HTTP_S3_AUTH_VARS } {
            let var = NonNull::new(unsafe { ngx_http_add_variable(cf, &raw mut v.name, v.flags) });
            let Some(mut var) = var else {
                return Status::NGX_ERROR.into();
            };
            let var = unsafe { var.as_mut() };
            var.get_handler = v.get_handler;
            var.data = v.data;
        }
        Status::NGX_OK.into()
    }
}

#[derive(Debug, Default)]
struct ModuleConfig {
    params: SigningParams,
}

unsafe impl HttpModuleLocationConf for Module {
    type LocationConf = ModuleConfig;
}

impl Merge for ModuleConfig {
    fn merge(&mut self, prev: &ModuleConfig) -> Result<(), MergeConfigError> {
        if self.params.access_key.is_empty() {
            self.params.access_key = prev.params.access_key.clone();
        }
        if self.params.secret_key.is_empty() {
            self.params.secret_key = prev.params.secret_key.clone();
        }
        if self.params.host.is_empty() {
            self.params.host = prev.params.host.clone();
        }
        if self.params.region.is_empty() {
            self.params.region = if prev.params.region.is_empty() {
                String::from("us-east-1")
            } else {
                prev.params.region.clone()
            };
        }
        Ok(())
    }
}

const CONF_FLAGS: ngx_uint_t =
    (NGX_HTTP_MAIN_CONF | NGX_HTTP_SRV_CONF | NGX_HTTP_LOC_CONF | NGX_CONF_TAKE1) as ngx_uint_t;

static mut NGX_HTTP_S3_AUTH_COMMANDS: [ngx_command_t; 5] = [
    ngx_command_t {
        name: ngx_string!("s3_auth_access_key_file"),
        type_: CONF_FLAGS,
        set: Some(set_access_key_file),
        conf: NGX_HTTP_LOC_CONF_OFFSET,
        offset: 0,
        post: ptr::null_mut(),
    },
    ngx_command_t {
        name: ngx_string!("s3_auth_secret_key_file"),
        type_: CONF_FLAGS,
        set: Some(set_secret_key_file),
        conf: NGX_HTTP_LOC_CONF_OFFSET,
        offset: 0,
        post: ptr::null_mut(),
    },
    ngx_command_t {
        name: ngx_string!("s3_auth_host"),
        type_: CONF_FLAGS,
        set: Some(set_host),
        conf: NGX_HTTP_LOC_CONF_OFFSET,
        offset: 0,
        post: ptr::null_mut(),
    },
    ngx_command_t {
        name: ngx_string!("s3_auth_region"),
        type_: CONF_FLAGS,
        set: Some(set_region),
        conf: NGX_HTTP_LOC_CONF_OFFSET,
        offset: 0,
        post: ptr::null_mut(),
    },
    ngx_command_t::empty(),
];

static NGX_HTTP_S3_AUTH_MODULE_CTX: ngx_http_module_t = ngx_http_module_t {
    preconfiguration: Some(Module::preconfiguration),
    postconfiguration: Some(Module::postconfiguration),
    create_main_conf: None,
    init_main_conf: None,
    create_srv_conf: None,
    merge_srv_conf: None,
    create_loc_conf: Some(Module::create_loc_conf),
    merge_loc_conf: Some(Module::merge_loc_conf),
};

// Linked statically into nginx via --add-module, so the symbol must be
// visible to the generated ngx_modules.c.
#[used]
#[allow(non_upper_case_globals)]
#[unsafe(no_mangle)]
pub static mut ngx_http_s3_auth_module: ngx_module_t = ngx_module_t {
    ctx: &raw const NGX_HTTP_S3_AUTH_MODULE_CTX as _,
    commands: unsafe { &raw mut NGX_HTTP_S3_AUTH_COMMANDS[0] },
    type_: NGX_HTTP_MODULE as _,
    ..ngx_module_t::default()
};

fn conf_arg(cf: *mut ngx_conf_t) -> Result<String, ()> {
    unsafe {
        let args: &[ngx_str_t] = (*(*cf).args).as_slice();
        args[1].to_str().map(String::from).map_err(|_| ())
    }
}

fn set_string_from_file(cf: *mut ngx_conf_t, out: &mut String) -> *mut c_char {
    let Ok(path) = conf_arg(cf) else {
        return ngx::core::NGX_CONF_ERROR;
    };
    match std::fs::read_to_string(&path) {
        Ok(contents) => {
            *out = contents.trim().to_string();
            ngx::core::NGX_CONF_OK
        }
        Err(err) => {
            ngx_conf_log_error!(NGX_LOG_EMERG, cf, "s3_auth: cannot read \"{path}\": {err}");
            ngx::core::NGX_CONF_ERROR
        }
    }
}

extern "C" fn set_access_key_file(
    cf: *mut ngx_conf_t,
    _cmd: *mut ngx_command_t,
    conf: *mut c_void,
) -> *mut c_char {
    let conf = unsafe { &mut *(conf as *mut ModuleConfig) };
    set_string_from_file(cf, &mut conf.params.access_key)
}

extern "C" fn set_secret_key_file(
    cf: *mut ngx_conf_t,
    _cmd: *mut ngx_command_t,
    conf: *mut c_void,
) -> *mut c_char {
    let conf = unsafe { &mut *(conf as *mut ModuleConfig) };
    set_string_from_file(cf, &mut conf.params.secret_key)
}

extern "C" fn set_host(
    cf: *mut ngx_conf_t,
    _cmd: *mut ngx_command_t,
    conf: *mut c_void,
) -> *mut c_char {
    let conf = unsafe { &mut *(conf as *mut ModuleConfig) };
    match conf_arg(cf) {
        Ok(v) => {
            conf.params.host = v;
            ngx::core::NGX_CONF_OK
        }
        Err(()) => ngx::core::NGX_CONF_ERROR,
    }
}

extern "C" fn set_region(
    cf: *mut ngx_conf_t,
    _cmd: *mut ngx_command_t,
    conf: *mut c_void,
) -> *mut c_char {
    let conf = unsafe { &mut *(conf as *mut ModuleConfig) };
    match conf_arg(cf) {
        Ok(v) => {
            conf.params.region = v;
            ngx::core::NGX_CONF_OK
        }
        Err(()) => ngx::core::NGX_CONF_ERROR,
    }
}

static mut NGX_HTTP_S3_AUTH_VARS: [ngx_http_variable_t; 2] = [
    ngx_http_variable_t {
        name: ngx_string!("s3v4_authorization"),
        set_handler: None,
        get_handler: Some(s3v4_authorization_variable),
        data: 0,
        flags: 0,
        index: 0,
    },
    ngx_http_variable_t {
        name: ngx_string!("s3v4_amz_date"),
        set_handler: None,
        get_handler: Some(s3v4_amz_date_variable),
        data: 0,
        flags: 0,
        index: 0,
    },
];

// Per-request cache so $s3v4_authorization and $s3v4_amz_date use the same
// timestamp.
#[derive(Debug, Default)]
struct S3AuthCtx {
    authorization: ngx_str_t,
    amz_date: ngx_str_t,
}

impl S3AuthCtx {
    fn save_str(s: &str, pool: &mut Pool) -> Option<ngx_str_t> {
        let data = pool.alloc_unaligned(s.len());
        if data.is_null() {
            return None;
        }
        unsafe { ptr::copy_nonoverlapping(s.as_ptr(), data as *mut u8, s.len()) };
        Some(ngx_str_t {
            len: s.len(),
            data: data as *mut u8,
        })
    }

    unsafe fn bind(s: &ngx_str_t, v: *mut ngx_variable_value_t) {
        let v = unsafe { &mut *v };
        if s.len == 0 {
            v.set_not_found(1);
            return;
        }
        v.set_valid(1);
        v.set_no_cacheable(0);
        v.set_not_found(0);
        v.set_len(s.len as u32);
        v.data = s.data;
    }
}

fn get_or_create_ctx(request: &mut http::Request) -> Option<&S3AuthCtx> {
    if let Some(ctx) = request.get_module_ctx::<S3AuthCtx>(Module::module()) {
        return Some(ctx);
    }

    let conf = Module::location_conf(request)?;
    let params = &conf.params;
    if params.access_key.is_empty() || params.secret_key.is_empty() || params.host.is_empty() {
        ngx_log_debug_http!(request, "s3_auth: credentials or host not configured");
        return None;
    }

    // Only read-only methods get signed: this proxy fronts a public binary
    // cache and must never authorize mutating requests with our credentials.
    if !matches!(request.method(), http::Method::GET | http::Method::HEAD) {
        ngx_log_debug_http!(request, "s3_auth: refusing to sign non-read method");
        return None;
    }

    let method = request.method().as_str().to_string();
    let unparsed_uri = request.unparsed_uri().to_str().ok()?.to_string();
    let amz_date = s3_sigv4::amz_datetime_now();
    let authorization = s3_sigv4::authorization_header(params, &method, &unparsed_uri, &amz_date);

    let mut pool = request.pool();
    let saved = S3AuthCtx {
        authorization: S3AuthCtx::save_str(&authorization, &mut pool)?,
        amz_date: S3AuthCtx::save_str(&amz_date, &mut pool)?,
    };
    let ctx = pool.allocate::<S3AuthCtx>(saved);
    if ctx.is_null() {
        return None;
    }
    request.set_module_ctx(ctx as *mut c_void, Module::module());
    Some(unsafe { &*ctx })
}

http_variable_get!(
    s3v4_authorization_variable,
    |request: &mut http::Request, v: *mut ngx_variable_value_t, _: usize| {
        match get_or_create_ctx(request) {
            Some(ctx) => unsafe { S3AuthCtx::bind(&ctx.authorization, v) },
            None => unsafe { (*v).set_not_found(1) },
        }
        Status::NGX_OK
    }
);

http_variable_get!(
    s3v4_amz_date_variable,
    |request: &mut http::Request, v: *mut ngx_variable_value_t, _: usize| {
        match get_or_create_ctx(request) {
            Some(ctx) => unsafe { S3AuthCtx::bind(&ctx.amz_date, v) },
            None => unsafe { (*v).set_not_found(1) },
        }
        Status::NGX_OK
    }
);
