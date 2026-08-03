ngx_addon_name=ngx_http_s3_auth_module
ngx_cargo_manifest=$ngx_addon_dir/module/Cargo.toml

# generate Makefile section for all the modules configured earlier
ngx_rust_make_modules
