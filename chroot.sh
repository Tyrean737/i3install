#Potential variables: timezone, lang and local

passwd

TZuser=$(cat tzfinal.tmp)

ln -sf /usr/share/zoneinfo/$TZuser /etc/localtime

hwclock --systohc

echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
echo "de_DE ISO-8859-1" >> /etc/locale.gen
locale-gen

pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager
systemctl start NetworkManager

pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg

pacman --noconfirm --needed -S dialog
larbs() { curl -O https://raw.githubusercontent.com/Tyrean737/i3install/master/install.sh && bash install.sh ;}
dialog --title "Install My Rice" --yesno "This install script will easily let you automatically install a full Arch Linux i3-gaps desktop environment.\n\nIf you'd like to install this, select yes, otherwise select no."  15 60 && larbs
