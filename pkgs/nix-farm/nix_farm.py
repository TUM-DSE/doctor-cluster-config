"""Log in to authelia (device flow) and run nix-fast-build against the farm."""

import base64
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Any

ISSUER = "https://auth.dos.cit.tum.de"
CLIENT = "nix-farm"
STORE = "grpc://farm.dos.cit.tum.de:443"
PLUGINS = "@plugins@"
NIX_FAST_BUILD = "@nix_fast_build@"

CACHE = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache")) / "nix-farm"
TOKEN = CACHE / "token"


def fetch(req: urllib.request.Request | str) -> dict[str, Any]:
    try:
        with urllib.request.urlopen(req) as resp:
            return dict(json.load(resp))
    except urllib.error.HTTPError as e:
        return dict(json.load(e))


def post(url: str, **data: str) -> dict[str, Any]:
    body = urllib.parse.urlencode({"client_id": CLIENT, **data}).encode()
    return fetch(urllib.request.Request(url, data=body))


def valid() -> bool:
    try:
        payload = TOKEN.read_text().split(".")[1]
        claims = json.loads(base64.urlsafe_b64decode(payload + "=="))
        return int(claims["exp"]) > time.time() + 60
    except (OSError, IndexError, ValueError, KeyError):
        return False


def save(token: str) -> None:
    CACHE.mkdir(parents=True, exist_ok=True, mode=0o700)
    TOKEN.touch(mode=0o600)
    TOKEN.write_text(token)


def login() -> None:
    endpoints = fetch(f"{ISSUER}/.well-known/openid-configuration")
    dev = post(endpoints["device_authorization_endpoint"], scope="openid")
    if "device_code" not in dev:
        sys.exit(f"nix-farm: {dev.get('error_description', dev)}")
    print(f"nix-farm: open {dev['verification_uri_complete']}", file=sys.stderr)
    while True:
        time.sleep(int(dev.get("interval", 5)))
        resp = post(
            endpoints["token_endpoint"],
            grant_type="urn:ietf:params:oauth:grant-type:device_code",
            device_code=dev["device_code"],
        )
        # The ID token: authelia's access token is opaque, and the farm
        # verifies a JWT whose audience is the client.
        if "id_token" in resp:
            return save(str(resp["id_token"]))
        if resp.get("error") not in ("authorization_pending", "slow_down"):
            sys.exit(f"nix-farm: {resp.get('error_description', resp)}")


def main() -> None:
    if not valid():
        login()
    store = f"{STORE}?token-file={TOKEN}"
    args = sys.argv[1:]
    if args == ["login"]:
        return
    if args == ["store"]:
        print(store)
        return
    os.environ["NIX_CONFIG"] = f"plugin-files = {PLUGINS}\n" + os.environ.get(
        "NIX_CONFIG", ""
    )
    os.execv(NIX_FAST_BUILD, [NIX_FAST_BUILD, "--store", store, *args])


if __name__ == "__main__":
    main()
