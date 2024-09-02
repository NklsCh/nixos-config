> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an *Alice* navigating the *wonderland*. At least for now.**

So anyways. Here's my dots. I hope you like them.

# Niklas's Nixflakes

## Flake Structure
Modules are grouped to be ***almost*** purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users use this paradigm.

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to fetch appropriate `host` and `user` specific configurations for a given device.

<details>
<summary>📊 Diagrams</summary>

![Flake Structure](docs/media/FlakeStructure10.png)
Disclaimer: This image is from [erictossell](https://github.com/erictossell) and overall the project is heavily inspired by his config so check him out too
</details> 
