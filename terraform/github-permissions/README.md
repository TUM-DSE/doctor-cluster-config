# Set github access permissions with groups

Creates and manages github groups to assign a group of users access to only some repos of an organization.
For example, to give personal github accounts of sys-prog tutors access to the sys-prog-tytors group.

## Prerequisites

- terraform installed (+ github and sops plugin)
- sops installed
- sops decryption key configured in `sops.yaml.nix` for the `admin` group or `terraform/secrets.enc.json`
- create a `.envrc.local` file as described [here](../README.md)


## Apply terraform

```console
git pull
cd terraform/github-permissions
./apply.sh
```
