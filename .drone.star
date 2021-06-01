def environment(extra={}):
  e = { "BUILDDIR": '/var/lib/drone/doctor-build' }
  e.update(extra)
  return e

build = {
  "name": 'Build NixOS and home-manager',
  "kind": 'pipeline',
  "type": 'exec',
  "steps": [{
    "name": 'build',
    "commands": [
      'rm -rf $BUILDDIR/gcroots.tmp && mkdir -p $BUILDDIR/gcroots.tmp',
      'nix shell nixpkgs#git nixpkgs#nix-build-uncached -c nix-build-uncached -build-flags "--out-link $BUILDDIR/gcroots.tmp/result" ./ci.nix',
      'rm -rf $BUILDDIR/gcroots && mv $BUILDDIR/gcroots.tmp $BUILDDIR/gcroots',
    ],
    "environment": environment(),
  }, {
    "name": 'send irc notification',
    "environment": environment(),
    "commands": [
      'LOGNAME=drone nix run .#irc-announce -- irc.r 6667 drone "#xxx" "build $DRONE_SYSTEM_PROTO://$DRONE_SYSTEM_HOST/$DRONE_REPO/$DRONE_BUILD_NUMBER : $DRONE_BUILD_STATUS" || true'
    ],
    "when": {
      "event": { "exclude": ['pull_request'] },
      "status": ['failure', 'success'],
    },
  }],
  "trigger": {
    "event": {
      "exclude": ['promote', 'rollback'],
    },
  },
};

def main(ctx):
  return [ build ]
