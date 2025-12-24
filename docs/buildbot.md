# Buildbot CI

All machines in this repository are built by [buildbot-nix](https://github.com/nix-community/buildbot-nix).
Build results are uploaded to the [cache.dos.cit.tum.de](https://cache.dos.cit.tum.de) binary cache.

- **Web UI**: https://buildbot.dse.in.tum.de/
- **Master host**: astrid
- **Worker host**: graham (x86_64), eliza (aarch64 remote builder)

## Architecture

```
GitHub webhook → astrid (master) → graham (worker) → builds → niks3 upload
                                 → eliza (aarch64 remote builder)
```

The master coordinates builds and provides the web UI. Workers execute the
actual nix evaluations and builds.

## Adding a Repository to Buildbot

### Step 1: Install the GitHub App

1. Go to https://github.com/apps/buildbox-nix-tum
2. Click "Install" and select the repository you want to add
3. Grant the app access to the repository

### Step 2: Add the GitHub Topic

1. Navigate to your repository on GitHub
2. Click the gear icon next to "About" on the right sidebar
3. Add the topic: `buildbot-tum-dse`
4. Save changes

### Step 3: Restart the Buildbot Master

The buildbot master needs to be restarted to pick up new repositories:

```bash
# SSH to astrid
ssh astrid.dos.cit.tum.de

# Restart buildbot-master service
sudo systemctl restart buildbot-master
```

Alternatively, admins (Mic92, pogobanane) can trigger a reload from the web UI.

## Adding Checks to Your Flake

Buildbot-nix evaluates the `.#checks` attribute of your flake. To add builds:

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

### Re-exporting NixOS Configurations

To build NixOS machines via CI (as done in this repository):

```nix
checks.x86_64-linux = {
  nixos-myhost = self.nixosConfigurations.myhost.config.system.build.toplevel;
};
```

### This Repository's Check Structure

The doctor-cluster-config flake (`flake.nix` lines 102-122) automatically builds:
- NixOS configurations for all machines (grouped by architecture)
- All packages defined in `packages/`
- All devShells

## Per-Repository Configuration

Create a `buildbot-nix.toml` in your repository root for custom settings:

```toml
[buildbot-nix]
# Use a different lock file
lock_file = "flake.lock"

# Evaluate a different attribute (default: checks)
attribute = "checks"

# Flake in a subdirectory
flake_dir = "."
```

## Supported Build Systems

The TUM-DSE buildbot instance supports:
- `x86_64-linux` (native on graham)
- `aarch64-linux` (remote builder on eliza)
- `i686-linux` (32-bit x86)

## Troubleshooting

### Build not triggering

1. Verify the GitHub App is installed on the repository
2. Check the repository has the `buildbot-tum-dse` topic
3. Restart buildbot-master: `sudo systemctl restart buildbot-master` on astrid
4. Check webhook delivery in GitHub repository settings → Webhooks

### Build failing

1. Check the build log at https://buildbot.dse.in.tum.de/
2. Ensure your `.#checks` attribute evaluates successfully locally:
   ```bash
   nix flake check -L
   ```
3. For large builds, check if the evaluation runs out of memory (32 workers, limited memory per worker)

### Viewing build outputs

Build outputs are stored at `/var/www/buildbot/nix-outputs` on astrid and
available via the web UI.

## Service Management

All services run on **astrid** except for the worker which runs on **graham**:

| Service | Host | Command |
|---------|------|---------|
| buildbot-master | astrid | `sudo systemctl restart buildbot-master` |
| buildbot-worker | graham | `sudo systemctl restart buildbot-worker` |
| reverse-proxy | doctor | `sudo systemctl restart nginx` |

## Configuration Files

- Master config: `modules/buildbot/master.nix`
- Worker config: `modules/buildbot/worker.nix`
- Builder setup: `modules/buildbot/builder.nix`
- Reverse proxy: `modules/buildbot/reverse-proxy.nix`
- Host mappings: `modules/buildbot/hostfile.nix`

## Secrets

Secrets are managed via sops and stored in `secrets.yaml`:
- `github-webhook-secret`
- `buildbot-github-oauth-secret`
- `buildbot-github-app-secret-key`
- `buildbot-nix-workers`
- `cachix-auth-token`

## Further Reading

- [buildbot-nix documentation](https://github.com/nix-community/buildbot-nix)
- [GitHub App setup guide](https://github.com/nix-community/buildbot-nix/blob/main/docs/GITHUB.md)
