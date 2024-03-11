{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch
    wget
    vim
    neovim
    vimPlugins.nvchad
    vscode
    alacritty
    rocmPackages.llvm.clang
    nodejs_21
  ];
}
