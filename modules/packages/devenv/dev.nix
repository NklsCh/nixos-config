{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    rocmPackages.llvm.clang
    nodejs_22
    termius
    gparted
    gh
    inetutils
  ];
}
