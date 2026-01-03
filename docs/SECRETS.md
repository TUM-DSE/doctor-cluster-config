# Managing Secrets

We use [sops](https://github.com/mozilla/sops) to encrypt sensitive data (passwords, keys, etc.).
The configuration for `sops` is generated from `sops.yaml.nix` and `pubkeys.json`.

## Accessing Secrets

To decrypt a file, use:

```bash
sops secrets.yml
```

This will open the file in your default editor.

## Adding a User

To grant a new user access to the encrypted secrets (e.g., `secrets.yml`), follow these steps:

1.  **Generate an Age Key**: We use [age](https://age-encryption.org/) for encryption. You need to generate a key pair and store it where `sops` can find it (usually `~/.config/sops/age/keys.txt`).

    ```bash
    mkdir -p ~/.config/sops/age
    age-keygen -o ~/.config/sops/age/keys.txt
    ```

    To see your **public key** (which you need for the next step), run:
    ```bash
    grep "public key" ~/.config/sops/age/keys.txt
    ```

2.  **Add Public Key to `pubkeys.json`**:
    *   Open `pubkeys.json`.
    *   Add the user's name and their **public** age key to the `users` object.
    ```json
    "users": {
      "existing_user": "age1...",
      "new_user": "age1..."
    }
    ```

3.  **Add User to Admin Group**:
    *   Open `sops.yaml.nix`.
    *   Add the user's name (matching the key in `pubkeys.json`) to the `admin` list in the `groups` let-binding.
    ```nix
    groups = with keys.users; {
      admin = [
        # ...
        new_user
      ];
      # ...
    };
    ```

4.  **Open a Pull Request**:
    *   Commit `pubkeys.json` and `sops.yaml.nix`.
    *   Open a Pull Request.
    *   Ask an existing admin to run `inv update-sops-files` to re-encrypt the secrets with your new key.

