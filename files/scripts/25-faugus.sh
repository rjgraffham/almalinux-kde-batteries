#!/usr/bin/env bash

set -xeuo pipefail

# Create first-time setup script for faugus and steam interop overrides
cat << 'EOF' >> /etc/systemd/system/faugus-setup.service
[Unit]
Description=Set up overrides for faugus-launcher flatpak
ConditionPathExists=!/etc/faugus-setup-complete

[Service]
Type=oneshot
ExecStart=flatpak override io.github.Faugus.faugus-launcher --filesystem=~/.var/app/com.valvesoftware.Steam/
ExecStart=flatpak override io.github.Faugus.faugus-launcher --talk-name=org.freedesktop.Flatpak
ExecStart=flatpak override com.valvesoftware.Steam --talk-name=org.freedesktop.Flatpak
ExecStart=flatpak override com.valvesoftware.Steam --filesystem=~/.var/app/io.github.Faugus.faugus-launcher/config/faugus-launcher/
ExecStart=touch /etc/faugus-setup-complete

[Install]
WantedBy=multi-user.target
EOF

systemctl enable faugus-setup.service