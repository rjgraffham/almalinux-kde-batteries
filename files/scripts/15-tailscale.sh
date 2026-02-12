#!/usr/bin/env bash

set -xeuo pipefail

# add tailscale repo and install
dnf -y config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install tailscale

# enable tailscale service
systemctl enable tailscaled