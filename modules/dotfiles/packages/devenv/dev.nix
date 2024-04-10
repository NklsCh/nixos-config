{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch
    wget
    vim
    neovim
    vscode
    alacritty
    rocmPackages.llvm.clang
    nodejs_21
    termius
    gparted
    rclone
    gh
  ];
}
