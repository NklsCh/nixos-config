> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an _Alice_ navigating through _Wonderland_. At least, for now.**

Anyway, here are my dotfiles. I hope you like them!

# Niklas's Nixflakes

## Flake Structure

The modules are grouped to be **_almost_** purely _functional_. As a result, you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users follow this paradigm.

This repository has become more opinionated over time and now requires passing down variables from `flake.nix` to fetch the appropriate `host` and `user` specific configurations for a given device.

<details>
<summary>📊 Diagrams</summary>

![Flake Structure](docs/media/FlakeStructure10.png)  
_Disclaimer: This image is from [erictossell](https://github.com/erictossell), and the overall project is heavily inspired by his config, so check it out too!_

</details>

<p>

## Structure

- `flake.nix`: Entry point and system configuration
- `hosts/`: Host-specific configurations
- `modules/`: Reusable configuration modules
- `users/`: User-specific configurations
- `scripts/`: Utility scripts

## Usage

1. Clone the repository to `/etc/nixos`
2. Choose or create a host configuration
3. Run `sudo nixos-rebuild switch --flake .#<hostname>`

## Profiles

- Minimal: Basic system without DE
- Desktop: Full desktop environment with Hyprland (NVIDIA Drivers)
- Development: Desktop with development tools
- Gaming: Desktop with gaming tools (NVIDIA Drivers)

## Adding a New Host

1. Create a new directory under `hosts/`
2. Add hardware-configuration.nix
3. Configure host-specific settings
4. Add to flake.nix

## Maintenance

- Update system: `sudo nixos-rebuild switch --flake .#<hostname>` or `nh os switch`
- Clean old generations: `sudo nix-collect-garbage -d` or `nh clean all`
- Update flake inputs: `nix flake update`
