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
echo "INSTALLING AUDIO COMPONENTS"
echo

PKGS=(
            'alsa-utils'        # Advanced Linux Sound Architecture (ALSA) Components https://alsa.opensrc.org/
            'alsa-plugins'      # ALSA plugins
            'pulseaudio'        # Pulse Audio sound components
            'pulseaudio-alsa'   # ALSA configuration for pulse audio
            'pavucontrol'       # Pulse Audio volume control
            'volumeicon'        # System tray volume control
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
