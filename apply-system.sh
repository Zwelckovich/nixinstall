#!/bin/sh
pushd ~/nixinstall
find ~/nixinstall/ -type f -name "*.nix" -execdir nixpkgs-fmt {} \;
sudo /run/current-system/bin/switch-to-configuration boot
sudo nix-collect-garbage -d
sudo nix flake update
sudo nixos-rebuild switch --flake .#zwelchnix
popd
