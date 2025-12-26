// AWS SigV4 authentication for S3 proxy
// Based on https://github.com/nginxinc/nginx-aws-signature
//
// Usage in nginx:
//   js_import s3 from s3_auth.js;
//   js_set $s3_auth_header s3.authHeader;
//   js_set $s3_date s3.amzDate;

var crypto = require('crypto');
var fs = require('fs');

// Read credentials from files copied by nginx preStart
var S3_ACCESS_KEY = fs.readFileSync('/run/nginx/s3-access-key').toString().trim();
var S3_SECRET_KEY = fs.readFileSync('/run/nginx/s3-secret-key').toString().trim();
var S3_BUCKET_HOST = 'dos-s3-1.s3.ito.cit.tum.de';
var S3_REGION = 'global';
var S3_SERVICE = 's3';

function _amzDatetime() {
    return new Date().toISOString().replace(/[:-]|\.\d{3}/g, '');
}

function _amzDate() {
    return _amzDatetime().slice(0, 8);
}

function _hash(data) {
    return crypto.createHash('sha256').update(data).digest('hex');
}

function _hmac(key, data) {
    return crypto.createHmac('sha256', key).update(data).digest();
}

function _hmacHex(key, data) {
    return crypto.createHmac('sha256', key).update(data).digest('hex');
}

function _buildSigningKey(secretKey, dateStamp, region, service) {
    var kDate = _hmac('AWS4' + secretKey, dateStamp);
    var kRegion = _hmac(kDate, region);
    var kService = _hmac(kRegion, service);
    var kSigning = _hmac(kService, 'aws4_request');
    return kSigning;
}

function _buildAuthorizationHeader(r) {
    var amzDatetime = _amzDatetime();
    var dateStamp = amzDatetime.slice(0, 8);

    var method = r.method;
    var uri = r.uri || '/';
    var queryString = r.variables.args || '';

    // Canonical headers (must be sorted alphabetically)
    var payloadHash = 'UNSIGNED-PAYLOAD';
    var canonicalHeaders =
        'host:' + S3_BUCKET_HOST + '\n' +
        'x-amz-content-sha256:' + payloadHash + '\n' +
        'x-amz-date:' + amzDatetime + '\n';
    var signedHeaders = 'host;x-amz-content-sha256;x-amz-date';

    // Build canonical request
    var canonicalRequest =
        method + '\n' +
        uri + '\n' +
        queryString + '\n' +
        canonicalHeaders + '\n' +
        signedHeaders + '\n' +
        payloadHash;

    var canonicalRequestHash = _hash(canonicalRequest);

    // Build string to sign
    var credentialScope = dateStamp + '/' + S3_REGION + '/' + S3_SERVICE + '/aws4_request';
    var stringToSign =
        'AWS4-HMAC-SHA256\n' +
        amzDatetime + '\n' +
        credentialScope + '\n' +
        canonicalRequestHash;

    // Calculate signature
    var signingKey = _buildSigningKey(S3_SECRET_KEY, dateStamp, S3_REGION, S3_SERVICE);
    var signature = _hmacHex(signingKey, stringToSign);

    // Build authorization header
    var authHeader =
        'AWS4-HMAC-SHA256 ' +
        'Credential=' + S3_ACCESS_KEY + '/' + credentialScope + ', ' +
        'SignedHeaders=' + signedHeaders + ', ' +
        'Signature=' + signature;

    return authHeader;
}

// Exported functions for js_set
function authHeader(r) {
    return _buildAuthorizationHeader(r);
}

function amzDate(r) {
    return _amzDatetime();
}

export default { authHeader, amzDate };
