#!/usr/bin/env bash

set -xeuo pipefail

# Start customizing your image here

# Examples:
# dnf install -y 'dnf-command(config-manager)'
# dnf config-manager --set-enabled crb

# Install starship, as a proof of concept for the image successfully building
dnf -y copr enable atim/starship 
dnf -y install starship