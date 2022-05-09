# Set github access permissions with groups

Creates and manages github groups to assign a group of users access to only some repos of an organization.
For example, to give personal github accounts of sys-prog tutors access to the sys-prog-tytors group.

## Prequesits

- terraform installed (+ github and sops plugin)
- sops installed
- sops decryption key configured in `sops.yaml.nix` for the `admin` group or `terraform/secrets.enc.json`


## Apply repo-permissions.tf

```console
git pull
cd terraform/github-permissions
terraform init
terraform apply # review changes and type yes
```
