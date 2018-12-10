#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mv /etc/pacman.d/mirrorlist  /etc/pacman/mirrorlist.bak
cp "$SCRIPT_DIR/mirrorlist"  /etc/pacman/mirrorlist
mv /etc/pacman.conf          /etc/pacman.conf.bak
cp "$SCRIPT_DIR/pacman.conf" /etc/pacman.conf

ln -sf "$SCRIPT_DIR/yaourtrc" ~/.yaourtrc

# Download pacman mirrorlist
# Uncomment the wanted mirror
#wget -O/etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/all/
#wget -O /etc/pacman.d/mirrorlist 'https://www.archlinux.org/mirrorlist/?country=CN'

pacman -S words
pacman -S go
pacman -S perl-rename
# yaourt -S jdk9-openjdk openjdk9-src
yaourt -S pet-git
# yaourt -S mosh
yaourt -S axel
yaourt -S shellcheck
yaourt -S highlight
yaourt -S fd
yaourt -S jq
yaourt -S pv
yaourt -S pigz
yaourt -S nethogs
yaourt -S icdiff # better diff
# yaourt -S global # gtags
yaourt -S universal-ctags-git # better ctags
yaourt -S ncdu   # NCurses Disk Usage
# yaourt -S create_ap # Create AP

# crontab
pacman -S cronie
systemctl enable cronie.service
systemctl start  cronie.service

# fcitx - gnome
pacman -S fcitx && ln -sf "$SCRIPT_DIR/xprofile" ~/.xprofile
# cool-retro-term is a terminal emulator which mimics the look and feel of the old cathode tube screens.
pacman -S cool-retro-term

# Auto clean pacman cache
pacman -S pacman-contrib
systemctl daemon-reload
systemctl enable paccache.timer
systemctl start paccache.timer
