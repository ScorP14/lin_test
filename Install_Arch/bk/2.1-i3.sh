#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  _________                 __________  ____   _____  
# /   _____/ ____  __________\______   \/_   | /  |  | 
# \_____  \_/ ___\/  _ \_  __ \     ___/ |   |/   |  |_
# /        \  \__(  <_> )  | \/    |     |   /    ^   /
#/_______  /\___  >____/|__|  |____|     |___\____   | 
#        \/     \/                                |__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING I3"
echo

PKGS=(
        'i3'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
