{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.fdroidserver
    pkgs.jdk
  ];
}
