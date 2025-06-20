# Secrets handling

Secrets handling is done through [sops-nix](https://github.com/Mic92/sops-nix)

## Quick usage guide

### Secrets administrator

As a secrets administrator we will need a age secret in order to administer secrets
(add, edit delete secrets and edit access rights of **who** can read these secrets)

Generate an age key:

```
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
```

or if you want to use your ssh key as an age key, convert it:

```
mkdir -p ~/.config/sops/age
nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```

Regardless, **safekeep** your key in ~/.config/sops/age, or you will lose access to your
secrets.

### Secrets configuration file

Maintains who can access what secrets. Usually in the root folder of your repo, called `.sops.yaml`

### Secrets file

Can be placed anywhere, in this repo, stored as `/secrets/vault.yaml`.

Edit file, as an administrator with:

```
nix-shell -p sops --run "sops secrets/example.yaml"
```

or if you have `sops` locally installed, even simpler with:

```
sops secrets/example.yaml
```

### Creating a new host and assigning access

- ## Get an age key from the server:
  ```
  nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
  ```
  - From the output, you need the string that starts with `age1XXXXXX`
- Enter the key in the `.sops.yaml` file as a new `&system_[hostname]`
- ## As an administrator, reencrypt the keys to add access to this host:
  ```
  sops updatekeys
  ```
- Commit the newly edited secrets files.

### Using secrets in nix files

See an example from this repo, or preferrably read the
[docs](https://github.com/Mic92/sops-nix)
