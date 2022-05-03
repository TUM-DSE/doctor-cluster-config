# Set github access permissions in bulk

Useful to give fine-grained access permissions for github repos in bulk. 
For example, to give personal github accounts of sys-prog tutors access to several repos.

Permissions (such as `push` permission) are defined as objects in `repo-permissions.tf`.

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
git add terraform.tfstate
git commit
git push
```
