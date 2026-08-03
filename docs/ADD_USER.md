# Adding a new user

Applies to students, chair members and reviewers.

**Note**: internally hired employees (that previously studied at TUM) need a chair admin to manually change affiliation to our chair for accessing our VPN and Xerox printers ("Änderung der Zugehörigkeit (oder Status) beantragen" for a user in strukturdb)

## 1. Pick file and uid

| Who | File | uid range |
|-----|------|-----------|
| Chair members | [`modules/users/chair-members.nix`](../modules/users/chair-members.nix) | 1000–2000 |
| Students | [`modules/users/students.nix`](../modules/users/students.nix) | 2000–3000 |
| Reviewers (artifact evaluation) | [`modules/users/reviewers.nix`](../modules/users/reviewers.nix) | 4000–5000 |

Use the next free uid in the range; it must be unique across all user files:

```console
$ grep -rho 'uid = [0-9]*' modules/users/ | sort -t= -k2 -n | tail
```

Returning user: remove them from `users.deletedUsers` and reuse their old
uid so `/home` file ownership still matches.

## 2. Add SSH key and user entry

Add the public key(s) as a `let` binding and a user entry, e.g.:

```nix
  marcKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBvkAAmA8/... space@George"
  ];
```

```nix
    # Marc, Student internship working w/ David (can be removed after Sep 2026)
    marc = {
      isNormalUser = true;
      home = "/home/marc";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2110;
      allowedHosts = [
        "jamie"
      ];
      openssh.authorizedKeys.keys = marcKeys;
      expires = "2026-09-01";
    };
```

- Comment: who the user is, supervisor, when the account can be removed.
- `allowedHosts` is mandatory. `[ "all" ]` only for chair members;
  students and reviewers get an explicit host list.
- `expires`: shortly after the expected end of the thesis/internship/review.
- Keep entries ordered by uid.
- `xrdpAccess = true;` only if graphical access is needed (e.g. Xilinx
  tools); then also generate a password, see
  [README.md → Accessing via xrdp](./README.md#accessing-via-xrdp).

## 3. Format, commit, PR

```console
$ nix fmt
$ git add modules/users/students.nix
$ git commit -m "students: add marc"
$ gh pr create
```

CI must be green before merging. Users may open the PR themselves; an
admin reviews and merges.

## 4. Deploy

Full deploy:

```console
$ inv deploy
```

Targeted deploy (faster) — astrid uploads the ssh keys to the jump host
(`login.dos.cit.tum.de`), plus the host(s) in `allowedHosts`:

```console
$ inv deploy-host --host astrid.dos.cit.tum.de
$ inv deploy-host --host jamie.dos.cit.tum.de
```

## 5. Verify

Jump host accepts the key:

```console
$ ssh -i <path/to/privkey> tunnel@login.dos.cit.tum.de -W graham.dos.cit.tum.de:22 </dev/null
```

Target machine (as admin):

```console
[root@jamie:~]# id marc
uid=2110(marc) gid=100(users) groups=100(users),1(wheel),131(docker),...

[root@jamie:~]# grep -c space@George /etc/ssh/authorized_keys.d/marc
1
```

End-to-end test, run by the user:

```console
$ ssh -v -F /dev/null -i <path/to/privkey> \
    -oProxyCommand="ssh tunnel@login.dos.cit.tum.de -i <path/to/privkey> -W %h:%p" \
    marc@jamie.dos.cit.tum.de
```

`-v` shows which key was offered and accepted:

```
debug1: Offering public key: /home/marc/.ssh/id_ed25519 ED25519 SHA256:...
debug1: Server accepts key: /home/marc/.ssh/id_ed25519 ED25519 SHA256:...
```

If authentication fails, check that the key offered by the client is the
one added to the config. `ssh-keygen -lf <pubkey>` prints the fingerprint
of a public key file:

```console
$ ssh-keygen -lf ~/.ssh/id_ed25519.pub
256 SHA256:exb2zADkqIyHIflDuWyvnPwWPvHqLtsgMpJLxp5a08A space@George (ED25519)
```

The `SHA256:...` fingerprint must match the one in the `Offering public
key:` line of the `ssh -v` output. If it does not, the user is offering a
different key than the one in the repo — either add the offered key or
have them use `-i` / `IdentityFile` to select the right one.

Then point the user to
[README.md → Accessing the server](./README.md#accessing-the-server) for
the `~/.ssh/config` setup.

Note: FPGA servers (hinoki, sakura, momiji) run Ubuntu and are managed
manually — accounts from this repo do not appear there. Same for the
Morello box (ace), see [morello.md](./morello.md).

## 6. Removing users

1. Ensure `/home/<user>` data is backed up or no longer needed.
2. Remove the user entry and key list.
3. Add the username to `users.deletedUsers` — this deletes the account
   and its data on next deploy.
