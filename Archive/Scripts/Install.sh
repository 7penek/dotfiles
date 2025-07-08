#!/bin/sh
# Alacritty Dependencies
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
# DoomEmacs Dependencies
sudo apt install emacs git ripgrep fd-find
# Symlink fd (Reference)
# ln -s $(which fdfind) $HOME/.local/bin/fd
# Toolchains
sudo apt install gcc r-base rust-all ruby-full python3-full python3-pip golang hugo nodejs npm php sqlite3 redis-server mariadb-server
# LaTeX
sudo apt install texlive-full
# Fonts
sudo apt install fonts-noto fonts-noto-mono fonts-noto-core fonts-noto-extra fonts-noto-ui-core fonts-noto-ui-extra
sudo apt install fonts-noto-cjk fonts-noto-cjk-extra fonts-noto-color-emoji ttf-mscorefonts-installer
# Fonts-Nerd (Reference)
# git clone --depth 1 https://github.com/ryanoasis/nerd-fonts $HOME/NERDFONTS
# cd $HOME/NERDFONTS
# ./install.sh
# Themes
sudo apt install breeze breeze-gtk-theme
# Audio Drivers
sudo apt install pipewire pipewire-alsa pipewire-pulse pipewire-jack pulsemixer wireplumber
# Video Drivers
sudo apt install xorg xserver-xorg xserver-xorg-core xserver-xorg-video-all xdg-utils
# Core Packages
sudo apt install intel-microcode bash hwinfo neofetch cmatrix rfkill ufw iwd network-manager iptables nftables
# Essential Packages
sudo apt install tar gnupg zip unzip unrar 7zip
sudo apt install apt git curl wget dpkg dpkg-dev make cmake automake build-essential tree qrencode xclip xdotool
# Utilities Packages
sudo apt install tlp tlp-rdw ethtool smartmontools
# Environment Packages
sudo apt install dunst picom i3 i3lock i3status suckless-tools unclutter pcmanfm nitrogen flameshot lxappearance qt5ct
# Development Packages
sudo apt install xterm kitty alacritty bat lsd fzf htop btop vim neovim when taskwarrior nnn newsboat
# Media Packages
sudo apt install feh sxiv imagemagick graphicsmagick mpd mpc ncmpcpp mpv vlc vlc-plugin-pipewire ffmpeg obs-studio
# Production Packages
sudo apt install gimp inkscape krita kdenlive
# Browser Packages (Slippery Slope)
# sudo apt install firefox chromium
# Miscellaneous Packages
sudo apt install keepassxc transmission-cli transmission-common transmission-daemon youtube-dl yt-dlp
# Virtualization Packages
sudo apt install qemu-system libvirt-daemon-system virt-manager virt-viewer
