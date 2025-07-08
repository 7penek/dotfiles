#!/bin/sh
# MEANT TO BE RUN AS ROOT
systemctl enable ufw.service
systemctl enable tlp.service
systemctl enable iptables.service
systemctl enable nftables.service
systemctl enable NetworkManager.service
systemctl enable NetworkManager-dispatcher.service
# MASKING RFKILL SERVICES TO AVOID CONFLICTS WITH TLP
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
