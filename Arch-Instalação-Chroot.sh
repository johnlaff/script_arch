#!/bin/bash

echo -e "Deixando o sistema em português"

echo -e "sudo pacman -S wget"
echo -e "cd /etc"
echo -e "wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/locale.conf"
echo -e "cd /etc/X11/xorg.conf.d/"
echo -e "wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/00-keyboard.conf"
echo -e "cp -r /etc/locale.conf /etc/vconsole.conf"
echo -e "echo -e pt_BR.UTF-8 UTF-8 > /etc/locale.gen"
echo -e "locale-gen"
echo -e "export LANG=pt_BR.UTF-8"
echo -e "localectl set-x11-keymap br abnt2"
echo -e "wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/hunspell-pt-br-3.2-5-any.pkg.tar.xz?raw=true -O hunspell-pt-br-3.2-5-any.pkg.tar.xz"
echo -e "pacman -U hunspell-pt-br-3.2-5-any.pkg.tar.xz"
echo -e "rm hunspell-pt-br-3.2-5-any.pkg.tar.xz"
echo -e "setfont"

sudo pacman -S wget
cd /etc
wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/locale.conf
cd /etc/X11/xorg.conf.d/
wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/00-keyboard.conf
cp -r /etc/locale.conf /etc/vconsole.conf
echo -e "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=pt_BR.UTF-8
localectl set-x11-keymap br abnt2
wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/hunspell-pt-br-3.2-5-any.pkg.tar.xz?raw=true -O hunspell-pt-br-3.2-5-any.pkg.tar.xz
pacman -U hunspell-pt-br-3.2-5-any.pkg.tar.xz
rm hunspell-pt-br-3.2-5-any.pkg.tar.xz
setfont

echo -e "Configurando o fuso horário"

echo -e "ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime"
echo -e "hwclock --systohc --utc"

ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc

echo -e "Criando senha root"

echo -e "passwd"

passwd

echo -e "Criando usuário e definindo senha"

echo -e "useradd -m -g users -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input -s /bin/bash johnlaff"
echo -e "usermod -a -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input johnlaff"
echo -e "passwd johnlaff"

useradd -m -g users -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input  -s /bin/bash johnlaff
usermod -a -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input johnlaff
passwd johnlaff

echo -e "Instalação GRUB"

echo -e "pacman -S grub bash-completion libusbx sdl bash xz gettext device-mapper freetype2 fuse2 dosfstools efibootmgr libisoburn mtools ntfs-3g"
echo -e "mkinitcpio -p linux"

pacman -S grub bash-completion libusbx sdl bash xz gettext device-mapper freetype2 fuse2 dosfstools efibootmgr libisoburn mtools ntfs-3g
mkinitcpio -p linux

echo -e "Configurando o GRUB"

echo -e "grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub"
echo -e "grub-mkconfig -o /boot/grub/grub.cfg"

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "Instalação do XORG"

echo -e "pacman -S xorg-xinit xorg-server xorg-server-devel"

pacman -S xorg-xinit xorg-server xorg-server-devel

echo -e "Configurações NetworkManager"

echo -e "systemctl enable NetworkManager.service"
echo -e "systemctl start NetworkManager.service"

systemctl enable NetworkManager.service
systemctl start NetworkManager.service

echo -e "Preparação para Jogos"

echo -e "pacman -Syy --asdeps egl-wayland winetricks wine_gecko wine-nine wine-mono eglexternalplatform libglvnd glfw-wayland clinfo opencl-headers opencl-mesa intel-opencl-clang libclc ocl-icd lib32-ocl-icd lib32-libglvnd lib32-glu glu libva-mesa-driver mesa mesa-demos mesa-vdpau lib32-mesa lib32-mesa-demos lib32-mesa-vdpau lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl sdl sdl2 sdl2_image sdl2_mixer sdl2_ttf sdl_image sdl_mixer sdl_ttf smpeg lib32-openal gambas3-gb-openal alure openal-examples openal freealut ffnvcodec-headers libxnvctrl xf86-video-nouveau nvidia-cg-toolkit steam-native-runtime lib32-gtk3 vulkan-devel attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 glu lib32-glu libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg samba xf86-video-ati xf86-video-amdgpu xf86-video-intel xf86-video-nouveau libva-intel-driver libva-utils libva-vdpau-driver libva1 libva1-intel-driver vulkan-icd-loader vulkan-intel vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers python-olefile python-pyqt5 wine-staging lutris xorg-server xorg-server-devel"
echo -e "pacman -Syy nvidia nvidia-settings lib32-libvdpau libvdpau nvidia-utils opencl-nvidia xsettingsd xsettings-client ffnvcodec-headers libxnvctrl xf86-video-nouveau lib32-nvidia-utils lib32-opencl-nvidia nccl nvidia-cg-toolkit"

pacman -Syy --asdeps egl-wayland winetricks wine_gecko wine-nine wine-mono eglexternalplatform libglvnd glfw-wayland clinfo opencl-headers opencl-mesa intel-opencl-clang libclc ocl-icd lib32-ocl-icd lib32-libglvnd lib32-glu glu libva-mesa-driver mesa mesa-demos mesa-vdpau lib32-mesa lib32-mesa-demos lib32-mesa-vdpau lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl sdl sdl2 sdl2_image sdl2_mixer sdl2_ttf sdl_image sdl_mixer sdl_ttf smpeg lib32-openal gambas3-gb-openal alure openal-examples openal freealut ffnvcodec-headers libxnvctrl xf86-video-nouveau nvidia-cg-toolkit steam-native-runtime lib32-gtk3 vulkan-devel attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 glu lib32-glu libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg samba xf86-video-ati xf86-video-amdgpu xf86-video-intel xf86-video-nouveau libva-intel-driver libva-utils libva-vdpau-driver libva1 libva1-intel-driver vulkan-icd-loader vulkan-intel vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers python-olefile python-pyqt5 wine-staging lutris xorg-server xorg-server-devel
pacman -Syy nvidia nvidia-settings lib32-libvdpau libvdpau nvidia-utils opencl-nvidia xsettingsd xsettings-client ffnvcodec-headers libxnvctrl xf86-video-nouveau lib32-nvidia-utils lib32-opencl-nvidia nccl nvidia-cg-toolkit

echo -e "Instalação dos Codecs"

echo -e "pacman -S lib32-libcanberra-gstreamer lib32-gstreamer lib32-gst-plugins-good lib32-gst-plugins-base-libs lib32-gst-plugins-base aribb24 gpac gst-libav lame libdvbpsi libiec61883 libmad libmp4v2 libmpeg2 mjpegtools mpg123 twolame xvidcore libquicktime sox libopusenc opus opus-tools opusfile schroedinger aom celt flac libde265 opencore-amr openjpeg2 speex libfishsound gst-plugins-base gst-plugins-base-libs gst-plugins-good gstreamer libcanberra-gstreamer fmt atomicparsley"

pacman -S lib32-libcanberra-gstreamer lib32-gstreamer lib32-gst-plugins-good lib32-gst-plugins-base-libs lib32-gst-plugins-base aribb24 gpac gst-libav lame libdvbpsi libiec61883 libmad libmp4v2 libmpeg2 mjpegtools mpg123 twolame xvidcore libquicktime sox libopusenc opus opus-tools opusfile schroedinger aom celt flac libde265 opencore-amr openjpeg2 speex libfishsound gst-plugins-base gst-plugins-base-libs gst-plugins-good gstreamer libcanberra-gstreamer fmt atomicparsley

echo -e "Otimizações"

echo -e "echo -e vm.swappiness=0 > /etc/sysctl.conf"
echo -e "net.ipv4.tcp_syncookies=1 >> /etc/sysctl.conf"
echo -e "net.ipv4.ip_forward=1 >> /etc/sysctl.conf"

echo -e "vm.swappiness=0" > /etc/sysctl.conf
echo -e "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf
echo -e "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

"Instalação de Fontes"
echo -e "pacman -S $(pacman -Ssq ttf)"
echo -e "fc-cache"

pacman -S $(pacman -Ssq ttf)
fc-cache

echo -e "Instalação VirtualBox"

echo -e "pacman -S virtualbox-host-modules-arch virtualbox-guest-iso virtualbox"

pacman -S virtualbox-host-modules-arch virtualbox-guest-iso virtualbox

echo -e "Instalação AUR"

echo -e "wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/yay-9.2.0-1-x86_64.pkg.tar.xz?raw=true -O yay-9.2.0-1-x86_64.pkg.tar.xz"
echo -e "pacman -U yay-9.2.0-1-x86_64.pkg.tar.xz"
echo -e "rm yay-9.2.0-1-x86_64.pkg.tar.xz"

wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/yay-9.2.0-1-x86_64.pkg.tar.xz?raw=true -O yay-9.2.0-1-x86_64.pkg.tar.xz
pacman -U yay-9.2.0-1-x86_64.pkg.tar.xz
rm yay-9.2.0-1-x86_64.pkg.tar.xz

echo -e "Dando permissões para ter acesso de Administrador"

echo -e "sudo pacman -S nano"
echo -e "nano /etc/sudoers"
echo -e "Procure pela linha: root ALL=(ALL) ALL"
echo -e "E logo abaixo inclua o seu usuário assim: UsuárioDaSuaPreferência ALL=(ALL) ALL"
echo -e "Exemplo de Arquivo:"
echo -e "root ALL=(ALL) ALL"
echo -e "UsuárioDaSuaPreferência ALL=(ALL) ALL"

echo -e "Tudo pronto! Agora basta escolher sua interface gráfica e ser feliz."

echo -e "Caso quiser instalar o KDE Plasma:"

echo -e "sudo pacman -S kf5-aids kate nomacs gimp krita packagekit packagekit-qt5 discover okular kf5 plasma plasma-wayland-session plasma-mediacenter qtav mpv youtube-dl vlc sddm firefox-i18n-pt-br firefox"
echo -e "systemctl enable sddm"

echo -e "Caso quiser instalar o Cinnamon:"

echo -e "sudo pacman -S cinnamon lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br"
echo -e "systemctl enable lightdm"

echo -e "Caso quiser instalar o GNOME:"

echo -e "sudo pacman -S gnome gnome-extra gnome-shell gdm gimp viewnior firefox firefox-i18n-pt-br"
echo -e "systemctl enable gdm"

echo -e "Caso quiser instalar o DEEPIN:"

echo -e "sudo pacman -S deepin deepin-extra lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br"
echo -e "systemctl enable lightdm"

echo -e "Caso quiser instalar o XFCE:"

echo -e "sudo pacman -S xfce4 xfce4-goodies lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br"
echo -e "systemctl enable lightdm"

echo -e "Caso quiser instalar o MATE:"

echo -e "sudo pacman -S mate mate-extra lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br"
echo -e "systemctl enable lightdm"
