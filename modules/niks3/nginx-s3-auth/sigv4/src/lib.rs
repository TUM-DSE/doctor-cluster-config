//! Minimal AWS Signature Version 4 signer for S3 GET/HEAD proxying.
//!
//! Signs only the headers host, x-amz-content-sha256 (fixed to
//! UNSIGNED-PAYLOAD) and x-amz-date. Paths are used verbatim (S3-style, no
//! normalization), which is sufficient for Nix binary cache object keys.

use hmac::{Hmac, Mac};
use sha2::{Digest, Sha256};

type HmacSha256 = Hmac<Sha256>;

pub const UNSIGNED_PAYLOAD: &str = "UNSIGNED-PAYLOAD";
pub const SIGNED_HEADERS: &str = "host;x-amz-content-sha256;x-amz-date";

#[derive(Debug, Clone, Default)]
pub struct SigningParams {
    pub access_key: String,
    pub secret_key: String,
    pub host: String,
    pub region: String,
}

fn hmac_sha256(key: &[u8], data: &[u8]) -> [u8; 32] {
    let mut mac = HmacSha256::new_from_slice(key).expect("HMAC accepts any key length");
    mac.update(data);
    mac.finalize().into_bytes().into()
}

fn sha256_hex(data: &[u8]) -> String {
    hex::encode(Sha256::digest(data))
}

/// Current time formatted as x-amz-date (YYYYMMDDTHHMMSSZ).
pub fn amz_datetime_now() -> String {
    let now = time::OffsetDateTime::now_utc();
    format_amz_datetime(now)
}

fn format_amz_datetime(t: time::OffsetDateTime) -> String {
    let (year, month, day) = (t.year(), t.month() as u8, t.day());
    let (hour, minute, second) = (t.hour(), t.minute(), t.second());
    format!("{year:04}{month:02}{day:02}T{hour:02}{minute:02}{second:02}Z")
}

/// Returns the Authorization header value for the given request at the given
/// x-amz-date timestamp.
pub fn authorization_header(
    params: &SigningParams,
    method: &str,
    unparsed_uri: &str,
    amz_date: &str,
) -> String {
    let date_stamp = &amz_date[..8];

    let (path, query) = match unparsed_uri.split_once('?') {
        Some((path, query)) => (path, query),
        None => (unparsed_uri, ""),
    };

    let canonical_request = format!(
        "{method}\n{path}\n{query}\n\
         host:{host}\n\
         x-amz-content-sha256:{UNSIGNED_PAYLOAD}\n\
         x-amz-date:{amz_date}\n\
         \n\
         {SIGNED_HEADERS}\n\
         {UNSIGNED_PAYLOAD}",
        host = params.host,
    );

    let credential_scope = format!("{date_stamp}/{}/s3/aws4_request", params.region);
    let string_to_sign = format!(
        "AWS4-HMAC-SHA256\n{amz_date}\n{credential_scope}\n{}",
        sha256_hex(canonical_request.as_bytes())
    );

    let k_date = hmac_sha256(
        format!("AWS4{}", params.secret_key).as_bytes(),
        date_stamp.as_bytes(),
    );
    let k_region = hmac_sha256(&k_date, params.region.as_bytes());
    let k_service = hmac_sha256(&k_region, b"s3");
    let k_signing = hmac_sha256(&k_service, b"aws4_request");
    let signature = hex::encode(hmac_sha256(&k_signing, string_to_sign.as_bytes()));

    format!(
        "AWS4-HMAC-SHA256 Credential={}/{credential_scope}, \
         SignedHeaders={SIGNED_HEADERS}, Signature={signature}",
        params.access_key,
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    // Signing key derivation example from
    // https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv-create-signed-request.html
    #[test]
    fn signing_key_derivation() {
        let secret = "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY";
        let k_date = hmac_sha256(format!("AWS4{secret}").as_bytes(), b"20150830");
        let k_region = hmac_sha256(&k_date, b"us-east-1");
        let k_service = hmac_sha256(&k_region, b"iam");
        let k_signing = hmac_sha256(&k_service, b"aws4_request");
        assert_eq!(
            hex::encode(k_signing),
            "c4afb1cc5771d871763a393e44b703571b55cc28424d1a5e86da6ed3c154a4b9"
        );
    }

    // Expected value computed independently with Python's hmac/hashlib
    // following the SigV4 specification.
    #[test]
    fn full_signature_is_deterministic() {
        let params = SigningParams {
            access_key: "AKIDEXAMPLE".into(),
            secret_key: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY".into(),
            host: "bucket.s3.example.com".into(),
            region: "global".into(),
        };
        let auth = authorization_header(&params, "GET", "/nix-cache-info", "20150830T123600Z");
        assert_eq!(
            auth,
            "AWS4-HMAC-SHA256 \
             Credential=AKIDEXAMPLE/20150830/global/s3/aws4_request, \
             SignedHeaders=host;x-amz-content-sha256;x-amz-date, \
             Signature=38beaf1acc94b6a75e225f71ba9fcd2eb481de800ff67f1dcd57fd6ab3432657"
        );
    }

    #[test]
    fn query_string_is_signed_separately() {
        let params = SigningParams {
            access_key: "k".into(),
            secret_key: "s".into(),
            host: "h".into(),
            region: "global".into(),
        };
        let with_query = authorization_header(&params, "GET", "/a?b=c", "20150830T123600Z");
        let without_query = authorization_header(&params, "GET", "/a", "20150830T123600Z");
        assert_ne!(with_query, without_query);
    }

    #[test]
    fn amz_datetime_format() {
        let t = time::OffsetDateTime::from_unix_timestamp(1_440_938_160).unwrap();
        assert_eq!(format_amz_datetime(t), "20150830T123600Z");
    }
}
