#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild switch --flake .#zwelchnix
popd
