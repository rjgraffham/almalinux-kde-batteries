#!/usr/bin/env bash

set -xeuo pipefail

# Install the hakuneko nightly as an rpm as it has no flatpak (self-updates on launch)
dnf -y install https://github.com/manga-download/hakuneko/releases/download/nightly-20200705.1/hakuneko-desktop_8.3.4_linux_amd64.rpm

# Set up install plans for system flatpaks we want in a base install (we don't install these
# directly to the image, instead it will ensure they're installed at first boot)
cat << 'EOF' >> /etc/flatpak/default-flatpaks/system/install
com.github.tchx84.Flatseal
org.mozilla.Firefox
org.libreoffice.LibreOffice
md.obsidian.Obsidian
EOF

# Same for removing flatpaks on first boot
cat << 'EOF' >> /etc/flatpak/default-flatpaks/system/remove
EOF
