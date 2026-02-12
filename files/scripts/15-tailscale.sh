#!/usr/bin/env bash

set -xeuo pipefail

# add tailscale repo and install
dnf -y config-manager --add-repo https://pkgs.tailscale.com/stable/rhel/10/tailscale.repo
dnf -y install tailscale

# enable tailscale service
systemctl enable tailscaled