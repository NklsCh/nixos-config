{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    rocmPackages.llvm.clang
    nodejs_21
    termius
    gparted
    gh
    inetutils
  ];
}
