#!/usr/bin/env bash

set -xeuo pipefail

# create nix root under /var and symlink to expected location
mkdir -p /var/nix
ln -s /var/nix /nix

# add basic command-line tools
dnf -y install \
    git \
    make \
    just \
    nix
