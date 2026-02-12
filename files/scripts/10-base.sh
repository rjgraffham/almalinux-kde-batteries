#!/usr/bin/env bash

set -xeuo pipefail

# add basic command-line tools
dnf -y install \
    git \
    make \
    just
