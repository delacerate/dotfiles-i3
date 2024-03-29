#!/bin/bash

# Ensure packages are up to date.
sudo pacman -Syu

# Make the function keys on the keyboard default over media keys.
# (This is currently specific to my keychron keyboard)

# Essentials.
sudo pacman -S git base-devel

# Install yay.
git clone https://aur.archlinux.org/paru.git ~/GitHub/paru/
cd ~/GitHub/paru/ && makepkg -si && cd ~

# Use yay to get pamac.
# yay -S libpamac-full pamac-all # Support for snap and flatpak.
sudo pacman -Syu polkit-gnome

# Browser.
# Keep firefox since some programs use it by default (for example cargo).
paru -S firefox brave-bin --noconfirm

# Office.
paru -S wps-office --noconfirm

# Some aesthetic stuff.
paru -S feh picom i3 rofi dunst polybar localsend --noconfirm

# Fonts.  This is very large, maybe use smaller package.
paru -S ttf-jetbrains-mono-nerd otf-codenewroman-nerd noto-fonts-cjk --noconfirm

# Utilities.
paru -S scrot zathura btop thunar gvfs gvfs-mtp thunar-volman thunar-archive-plugin lazygit flameshot brightnessctl pfetch --no-confirm

# Bootloader.
#sudo pamac install refind --no-confirm
#refind-install
#sudo chmod +x ~/.scripts/setup_refind.sh && ~/.scripts/setup_refind.sh

# LY Login manager.
#sudo pamac install ly --no-confirm

# SDDM Login Manager
#sudo pamac install sddm sddm-sugar-dark sddm-sugar-candy-git archlinux-tweak-tool-git --no-confirm
#sudo systemctl disable display-manager && sudo systemctl enable sddm
#sudo touch /etc/sddm.conf
#sudo sh -c "echo '[Theme]' >> /etc/sddm.conf"
#sudo sh -c "echo 'Current=sugar-candy' >> /etc/sddm.conf"
#sudo cp ~/.wallpapers/mountain_jaws.jpg /usr/share/sddm/themes/sugar-candy/
#sudo mv /usr/share/sddm/themes/sugar-candy/mountain_jaws.jpg /usr/share/sddm/themes/sugar-candy/wall_secondary.png

# Gnome stuff.
#sudo pamac install gnome-browser-connector gnome-tweaks --no-confirm

# Bluetooth.
paru -S blueman --noconfirm
sudo systemctl enable bluetooth.service && sudo systemctl restart bluetooth.service
#sudo sed -i 's/#AutoEnable=false/AutoEnable=true/g' /etc/bluetooth/main.conf # Enable on startup.

# Terminal.
paru -S kitty --noconfirm

# Coding stuff.
sudo pamac install neovim ripgrep neovide xclip nvim-packer-git --no-confirm
sudo pamac install nodejs github-desktop github-cli code --no-confirm

# Communication.
sudo pamac install thunderbird whatsapp-nativefier discord signal-desktop --no-confirm

# i3 stuff.
sudo pamac install feh xborder-git cronie rofi rofi-greenclip picom --no-confirm
chmod +x ~/.config/picom/scripts/toggle-picom-inactive-opacity.sh
# Stuff for polybar.
chmod +x ~/.config/polybar.personal/scripts/check-read-mode-status.sh
sudo pamac install polybar python-pywal pywal-git networkmanager-dmenu-git calc --no-confirm

# Sound stuff.
sudo pamac install pulseaudio pavucontrol alsa-utils --no-confirm
# Prevent the crackling sound.
sudo sed -i 's/load-module module-udev-detect/load-module module-udev-detect tsched=0/g' /etc/pulse/default.pa

# Media.
sudo pamac install playerctl --no-confirm

# Power management.
sudo pamac install tlp --no-confirm
systemctl enable tlp.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
sudo tlp start

# Programming.
sudo pamac install julia-bin emf-langserver cmake python --no-confirm

# Setup optimus manager.
# NB: For Nvidia cards only!
sudo pamac install optimus-manager gdm-prime nvidia-settings nvidia-force-comp-pipeline --no-confirm
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo sed -i 's/DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sudo sed -i 's/DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sudo touch /etc/optimus-manager/optimus-manager.conf
sudo sh -c "echo '[optimus]' > /etc/optimus-manager/optimus-manager.conf"
sudo sh -c "echo 'startup_mode=nvidia' > /etc/optimus-manager/optimus-manager.conf"
nvidia-force-composition-pipeline
systemctl enable optimus-manager && systemctl start optimus-manager &

# Enable SysRq keys.
sudo touch /etc/sysctl.d/99-sysctl.conf
sudo sh -c "echo 'kernel.sysrq=1' >> /etc/sysctl.d/99-sysctl.conf"

# Install s-tui and set to run as admin.
sudo pamac install s-tui --no-confirm

# Add bnaries to sudoers.
sudo sh -c "echo 'alex ALL = NOPASSWD: /usr/bin/s-tui, /usr/bin/pacman' > /etc/sudoers"

# Setup github.
sudo chmod +x ~/.scripts/setup_git.sh && sudo ~/.scripts/setup_git.sh

# Install language servers.
sudo chmod +x ~/.config/nvim/lua/alex/lang/lsp/install-servers.sh
~/.config/nvim/lua/alex/lang/lsp/install-servers.sh

# Install lock screen.
sudo pamac install betterlockscreen-git --no-confirm
# Setup lock screen.
# Should this script run every time the screens change?  Yeah.
# betterlockscreen -u ~/.wallpapers/forest-mountain-cloudy-valley.png --blur 0.5
# betterlockscreen -u ~/.wallpapers/misty_mountains.jpg --blur 0.5
betterlockscreen -u ~/.wallpapers/mountain_jaws.jpg --blur 0.5
betterlockscreen -u ~/.wallpapers/mountain_jaws.jpg

# Setup fish (shell).
#sudo pamac install fish --no-confirm
#fish <<'END_FISH'
#	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
#	fisher install IlanCosman/tide@v5t
#    echo "3\
#          2\
#          2\
#          4\
#          4\
#          5\
#          2\
#          1\
#          1\
#          2\
#          2\
#          y\
#         " | tide configure
#END_FISH
