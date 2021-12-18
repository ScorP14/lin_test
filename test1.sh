pacstrap -i /mnt base base-devel linux-zen linux-zen-headers linux-firmware dosfstools btrfs-progs intel-ucode iucode-tool nano --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asua/Irkutsk /etc/localtime

hwclock --systohc

# Выбираем языки клавиатуры  и генирируем		

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen		
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen	
locale-gen		

echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf

echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16	" >> /etc/vconsole.conf

# Имя компа, хосты	
echo "scorp" >> /etc/hostname
echo "127.0.0.1 localhost	" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 scorp.localhost scorp" >> /etc/hosts

mkinitcpio -P
passwd

pacman -S grub efibootmgr dhcpcd dhclient networkmanager --noconfirm --needed
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot
