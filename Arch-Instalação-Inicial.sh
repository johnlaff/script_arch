#!/bin/bash

echo -e "Primeiro de Tudo Particione o HD"
echo -e "Crie sda1 500MB para boot"
echo -e "Crie sda2 para raiz /"
echo -e "Crie sda3 512MB ou 3GB para swap / 3GB se quiser o modo hibernar"
loadkeys br-abnt2
sudo cfdisk /dev/sda
# nano /etc/locale.gen
# locale-gen && export LANG=pt_BR.UTF-8

echo -e "Formatação das Partições"

echo -e "mkfs.fat -F32 -n BOOT /dev/sda1"
echo -e "mkfs.ext4 /dev/sda2"
echo -e "mkswap /dev/sda3"
echo -e "swapon /dev/sda3"

mkfs.fat -F32 -n BOOT /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3

echo -e "Montagem das Partições e Criação da Home"

echo -e "mkdir -p /mnt/home && mount /dev/sda2 /mnt/home"
echo -e "mkdir -p /mnt/boot && mount /dev/sda1 /mnt/boot"

mkdir -p /mnt/home && mount /dev/sda2 /mnt/home
mkdir -p /mnt/boot && mount /dev/sda1 /mnt/boot

echo -e "Pacotes necessários"
echo -e "pacman -Syy archlinux-keyring arch-install-scripts btrfs-progs"

pacman -Syy archlinux-keyring arch-install-scripts btrfs-progs


echo -e "Instalação da base do sistema"

echo -e "pacstrap /mnt base base-devel"

pacstrap /mnt base base-devel

echo -e "Gerar Fstab"

echo -e "genfstab -U -p /mnt >> /mnt/etc/fstab"

genfstab -U -p /mnt >> /mnt/etc/fstab

echo -e "Confira se as partições foram geradas corretamente"

echo -e "cat /mnt/etc/fstab"

cat /mnt/etc/fstab

echo -e "Primeira fase da instalação realizada com sucesso!"
echo -e "Entrando no modo chroot,por favor rode o script do chroot agora."

echo -e "arch-chroot /mnt"

arch-chroot /mnt
