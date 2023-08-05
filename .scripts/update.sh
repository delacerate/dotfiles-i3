sudo reflector --download-timeout 30 --country 'ID, AU, SG' --latest 30 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
