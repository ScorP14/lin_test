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
echo "INSTALLING PRINTER DRIVERS"
echo

PKGS=(
    'cups'                  # Open source printer drivers
    'cups-pdf'              # PDF support for cups
    'ghostscript'           # PostScript interpreter
    'gsfonts'               # Adobe Postscript replacement fonts
    'hplip'                 # HP Drivers
    'system-config-printer' # Printer setup  utility
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Enabling the cups service daemon so we can print"
systemctl enable org.cups.cupsd.service  
systemctl start org.cups.cupsd.service

echo
echo "Done!"
echo
