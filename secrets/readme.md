# Secrets handling

Secrets handling is done through [agenix](https://github.com/ryantm/agenix)

## Tutorial

1. The system you want to deploy secrets to should already exist and
   have `sshd` running on it so that it has generated SSH host keys in
   `/etc/ssh/`.

2. Make a directory to store secrets and `secrets.nix` file for listing secrets and their public keys:
   ```ShellSession
   $ mkdir secrets
   $ cd secrets
   $ touch secrets.nix
   ```
   This `secrets.nix` file is **not** imported into your NixOS configuration.
   It's only used for the `agenix` CLI tool (example below) to know which public keys to use for encryption.
3. Add public keys to your `secrets.nix` file:

   ```nix
   let
     user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0idNvgGiucWgup/mP78zyC23uFjYq0evcWdjGQUaBH";
     user2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILI6jSq53F/3hEmSs+oq9L4TwOo1PrDMAgcA1uo1CCV/";
     users = [ user1 user2 ];

     system1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPJDyIr/FSz1cJdcoW69R+NrWzwGK/+3gJpqD1t8L2zE";
     system2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzxQgondgEYcLpcPdJLrTdNgZ2gznOHCAxMdaceTUT1";
     systems = [ system1 system2 ];
   in
   {
     "secret1.age".publicKeys = [ user1 system1 ];
     "secret2.age".publicKeys = users ++ systems;
   }
   ```

   These are the users and systems that will be able to decrypt the `.age` files later with their corresponding private keys.
   You can obtain the public keys from

   - your local computer usually in `~/.ssh`, e.g. `~/.ssh/id_ed25519.pub`.
   - from a running target machine with `ssh-keyscan`:
     ```ShellSession
     $ ssh-keyscan <ip-address>
     ... ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzxQgondgEYcLpcPdJLrTdNgZ2gznOHCAxMdaceTUT1
     ...
     ```
   - from GitHub like https://github.com/ryantm.keys.

4. Create a secret file:
   ```ShellSession
   $ agenix -e secret1.age
   ```
   It will open a temporary file in the app configured in your $EDITOR environment variable.
   When you save that file its content will be encrypted with all the public keys mentioned in the `secrets.nix` file.
5. Add secret to a NixOS module config:

   ```nix
   {
     age.secrets.secret1.file = ../secrets/secret1.age;
   }
   ```

   When the `age.secrets` attribute set contains a secret, the `agenix` NixOS module will later automatically decrypt and mount that secret under the default path `/run/agenix/secret1`.
   Here the `secret1.age` file becomes part of your NixOS deployment, i.e. moves into the Nix store.

6. Reference the secrets' mount path in your config:
   ```nix
   {
     users.users.user1 = {
       isNormalUser = true;
       passwordFile = config.age.secrets.secret1.path;
     };
   }
   ```
   You can reference the mount path to the (later) unencrypted secret already in your other configuration.
   So `config.age.secrets.secret1.path` will contain the path `/run/agenix/secret1` by default.
7. Use `nixos-rebuild` or [another deployment tool](https://wiki.nixos.org/wiki/Applications#Deployment") of choice as usual.

   The `secret1.age` file will be copied over to the target machine like any other Nix package.
   Then it will be decrypted and mounted as described before.

8. Edit secret files:
   ```ShellSession
   $ agenix -e secret1.age
   ```
   It assumes your SSH private key is in `~/.ssh/`.
   In order to decrypt and open a `.age` file for editing you need the private key of one of the public keys
   it was encrypted with. You can pass the private key you want to use explicitly with `-i`, e.g.
   ```ShellSession
   $ agenix -e secret1.age -i ~/.ssh/id_ed25519
   ```
