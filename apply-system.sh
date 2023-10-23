#!/bin/sh
pushd ~/.dotfiles
# find ~/nix-config/ -type f -name "*.nix" -execdir nixpkgs-fmt {} \;
# sudo /run/current-system/bin/switch-to-configuration boot
# sudo nix-collect-garbage -d
sudo nix flake update
sudo nixos-rebuild switch --flake .#zwelchnix
popd
