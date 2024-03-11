{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch
    wget
    vim
    vscode
    alacritty
    rocmPackages.llvm.clang
    nodejs_21
  ];
}
