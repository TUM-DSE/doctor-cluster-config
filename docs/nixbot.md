# Nixbot CI

All machines in this repository are built by
[nixbot](https://github.com/Mic92/nixbot), the standalone rewrite of
buildbot-nix. It builds in the [build farm](./nix-farm.md), whose workers
upload the results to the [niks3](https://niks3.dos.cit.tum.de) binary cache.

- **Web UI**: https://buildbot.dse.in.tum.de/
- **Service host**: graham (runs the single `nixbot` service)
- **Builders**: the [build farm](./nix-farm.md)
- **Reverse proxy**: doctor (TLS termination → graham's nginx)

Nixbot is a single NixOS service. It handles forge webhooks,
nix-eval-jobs evaluation, builds in the farm, commit statuses, and its own
web frontend.

## Architecture

```
GitHub webhook → doctor (TLS proxy) → graham (nixbot service)
                                          → build farm
                                              → niks3 upload
```

The status check contexts keep the `buildbot/` prefix
(`statusContextPrefix = "buildbot"`) so existing GitHub branch
protection rules still match.

## Adding a Repository to Nixbot

### Step 1: Install the GitHub App

1. Go to https://github.com/apps/buildbox-nix-tum
2. Click "Install" and select the repository you want to add
3. Grant the app access to the repository

### Step 2: Enable the Project

Nixbot discovers every repository the GitHub App can access (hourly
background sync). To start building one, log in as an admin (Mic92,
pogobanane) at https://buildbot.dse.in.tum.de/ and toggle the project on.
If a freshly created repo is missing, click the refresh button to re-run
discovery immediately.

Push, pull_request, check_run and check_suite events arrive through the
App-level webhook.

## Adding Checks to Your Flake

Nixbot evaluates the `.#checks` attribute of your flake in parallel; each
attribute becomes a separate build step. To add builds:

### Basic Example

```nix
{
  outputs = { self, nixpkgs, ... }: {
    checks.x86_64-linux = {
      # Build a package
      mypackage = self.packages.x86_64-linux.mypackage;

      # Run tests
      tests = nixpkgs.legacyPackages.x86_64-linux.runCommand "tests" {} ''
        echo "Running tests..."
        touch $out
      '';
    };

    checks.aarch64-linux = {
      # ARM64 builds
      mypackage-arm = self.packages.aarch64-linux.mypackage;
    };
  };
}
```

You can reproduce CI locally with `nix flake check -L` or
[nix-fast-build](https://github.com/Mic92/nix-fast-build).

### Re-exporting NixOS Configurations

To build NixOS machines via CI (as done in this repository):

```nix
checks.x86_64-linux = {
  nixos-myhost = self.nixosConfigurations.myhost.config.system.build.toplevel;
};
```

### This Repository's Check Structure

The doctor-cluster-config flake exposes these as `.#checks` in
`flake.nix`:
- NixOS configurations for all machines (`nixos-<host>`, grouped by
  build platform)
- devShells (`devShell-<name>`)
- a home-manager evaluation (`home-manager-eval`)

## Supported Build Systems

Configured via `buildSystems` in `modules/buildbot/nixbot.nix`:
- `x86_64-linux`
- `aarch64-linux`
- `i686-linux` (32-bit x86)

## Viewing Build Logs

The commit status / check run on a PR links to the build page at
`https://buildbot.dse.in.tum.de/repos/github/<owner>/<name>/builds/<number>`.
From there each attribute has a log viewer.

The build plan also links a raw log per attribute, which is handy for
grepping or downloading the full build output in a browser:

```
https://buildbot.dse.in.tum.de/repos/github/<owner>/<name>/builds/<number>/logs/raw/<attr>
```

Append `?tail=N` to fetch only the last N lines.

## Troubleshooting

### Build not triggering

1. Verify the GitHub App is installed on the repository
2. Enable the project in the web UI (reload the project list first if it
   is missing)
3. Check App webhook deliveries under the GitHub App's "Advanced" tab

### Build failing

1. Check the build log at https://buildbot.dse.in.tum.de/ (see
   [Viewing Build Logs](#viewing-build-logs))
2. Ensure your `.#checks` attribute evaluates successfully locally:
   ```bash
   nix flake check -L
   ```
3. For large builds, check whether evaluation runs out of memory
   (`evalWorkerCount = 32`)

### Viewing build outputs

Build outputs are stored at `/var/www/buildbot/nix-outputs/` on graham
(`outputsPath`) and served via graham's nginx; the last attribute of a
build is protected from garbage collection.

## Service Management

| Service | Host | Command |
|---------|------|---------|
| nixbot | graham | `sudo systemctl restart nixbot` |
| reverse-proxy | doctor | `sudo systemctl restart nginx` |

## Configuration Files

- Nixbot service config: `modules/buildbot/nixbot.nix`
- Build farm: `modules/nix-farm/`
- Remote builder / worker user: `modules/buildbot/builder.nix`
- Reverse proxy: `modules/buildbot/reverse-proxy.nix`
- Host mappings: `modules/buildbot/hostfile.nix`

## Secrets

Secrets are managed via sops. The GitHub App / webhook / builder secrets
live in graham's default sops file (`hosts/graham.yml`). The niks3 token
belongs to the farm workers ([nix-farm.md](./nix-farm.md)):
- `github-webhook-secret`
- `buildbot-github-oauth-secret`
- `buildbot-github-app-secret-key`
- `buildbot-builder-ssh-key`

## Further Reading

- [nixbot documentation](https://github.com/Mic92/nixbot)
- [migration guide (buildbot-nix → nixbot)](https://github.com/Mic92/nixbot/blob/main/docs/MIGRATION.md)
- [GitHub App setup guide](https://github.com/Mic92/nixbot/blob/main/docs/GITHUB.md)
