#!/usr/bin/env bash

set -xeuo pipefail

# add PackageKit to handle command-not-found
dnf -y install \
    packagekit

# create /nix to be used as mountpoint by determinate nix installer
mkdir -p /nix

# add basic command-line tools
dnf -y install \
    git \
    make \
    just
