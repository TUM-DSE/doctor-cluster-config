# DSE Nix Binary Cache

The DSE cluster runs a self-hosted Nix binary cache using [niks3](https://github.com/Mic92/niks3), backed by TUM ITO S3 storage.

## Overview

- **Cache URL**: `https://cache.dos.cit.tum.de`
- **niks3 Server**: `https://niks3.dos.cit.tum.de` (for pushing)
- **S3 Backend**: `s3.ito.cit.tum.de` (TUM ITO Ceph storage)
- **Server Host**: astrid (buildbot master)

## Public Key

Add this to your `nix.settings.trusted-public-keys`:

```
cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg=
```

## Using the Cache Locally

### NixOS Configuration

```nix
{
  nix.settings = {
    substituters = [
      "https://cache.dos.cit.tum.de"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
}
```

### Command Line

```bash
# One-time use
nix build --substituters 'https://cache.dos.cit.tum.de https://cache.nixos.org' \
          --trusted-public-keys 'cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY='

# Or add to ~/.config/nix/nix.conf
extra-substituters = https://cache.dos.cit.tum.de
extra-trusted-public-keys = cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg=
```

## Pushing to the Cache

### From Command Line

```bash
# Get niks3 CLI
nix shell github:Mic92/niks3

# Push a store path (requires API token)
niks3 push \
  --server-url https://niks3.dos.cit.tum.de \
  --auth-token-path /path/to/token \
  /nix/store/...-package
```

### From GitHub Actions

Use OIDC authentication to push without storing secrets:

```yaml
name: Build and Cache

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      id-token: write  # Required for OIDC

    steps:
      - uses: actions/checkout@v4

      - uses: cachix/install-nix-action@v31
        with:
          extra_nix_config: |
            extra-substituters = https://cache.dos.cit.tum.de
            extra-trusted-public-keys = cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg=

      - name: Get OIDC token
        id: oidc
        run: |
          token=$(curl -s -H "Authorization: bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" \
            "$ACTIONS_ID_TOKEN_REQUEST_URL&audience=https://niks3.dos.cit.tum.de" | jq -r '.value')
          echo "::add-mask::$token"
          echo "token=$token" >> "$GITHUB_OUTPUT"

      - name: Build
        run: nix build --log-format bar-with-logs

      - name: Push to cache
        run: |
          curl -fsSL "https://github.com/Mic92/niks3/releases/latest/download/niks3_$(uname -s)_$(uname -m).tar.gz" | tar -xzf -
          ./niks3 push \
            --server-url https://niks3.dos.cit.tum.de \
            --auth-token "${{ steps.oidc.outputs.token }}" \
            ./result
```

To enable OIDC for your repository, contact the infrastructure team to add your GitHub organization/repository to the allowed list.

## Infrastructure Setup

The cache runs on `astrid` (the buildbot master) with the following components:

- **niks3 server** (astrid): Handles uploads, tracks references for GC
- **PostgreSQL** (astrid): Stores closure metadata for garbage collection
- **nginx reverse proxy** (doctor): TLS termination with ACME/Let's Encrypt
- **S3 storage**: TUM ITO Ceph (`s3.ito.cit.tum.de`, bucket `dos-s3-1`)

Configuration:
- [`modules/niks3/default.nix`](../modules/niks3/default.nix) - niks3 server on astrid
- [`modules/niks3/reverse-proxy.nix`](../modules/niks3/reverse-proxy.nix) - nginx on doctor

### Architecture

```
                         Internet
                            │
                            ▼
                    ┌───────────────────┐
                    │  DNS (TUM)        │
                    │ cache.dos.cit.tum.de ──┐
                    │ niks3.dos.cit.tum.de ──┤
                    └───────────────────┘   │
                                            ▼
┌──────────────┐    ┌───────────────────┐   ┌─────────────────┐
│ niks3 push   │───▶│  doctor (nginx)   │──▶│  astrid (niks3) │
│ (CI/local)   │    │  TLS termination  │   │  port 5752      │
└──────────────┘    └───────────────────┘   └────────┬────────┘
                                                     │
┌──────────────┐                                     ▼
│  Nix Clients │                            ┌─────────────────┐
│  (read)      │───────────────────────────▶│   TUM ITO S3    │
└──────────────┘                            │ (dos-s3-1)      │
                                            └─────────────────┘
```

Writes go through doctor → astrid → S3. Reads can go directly to S3 (once public).

### DNS Requirements

The following DNS records need to be configured in TUM's DNS to point to doctor's external IP:

- `cache.dos.cit.tum.de` → doctor (for cache reads via niks3)
- `niks3.dos.cit.tum.de` → doctor (for cache writes/push)

## Garbage Collection

niks3 runs automatic garbage collection daily, removing:
- Closures older than 30 days
- Failed uploads older than 6 hours

## Troubleshooting

### Cache not being used

Check if the cache is reachable:
```bash
curl -I https://cache.dos.cit.tum.de/nix-cache-info
```

Verify your configuration:
```bash
nix show-config | grep substituters
nix show-config | grep trusted-public-keys
```

### Push failures

Verify connectivity to niks3 server:
```bash
curl -I https://niks3.dos.cit.tum.de
```

Check your token is valid (for API token auth):
```bash
niks3 push --server-url https://niks3.dos.cit.tum.de --auth-token-path /path/to/token --dry-run ./result
```
