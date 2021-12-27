#!/bin/sh
if [[ "$EUID" != 0 ]]; then
	echo "Run as root"
	exit
else
sudo eopkg install nvidia-glx-driver-common nvidia-glx-driver-current nvidia-glx-driver-modaliases nvidia-glx-driver-32bit -y
sudo eopkg remove xorg-driver-video-nouveau -y
sudo mkdir -p /etc/kernel/cmdline.d
sudo echo "nvidia-drm.modeset=1" | sudo tee /etc/kernel/cmdline.d/50-nvidia-drm.conf
sudo clr-boot-manager update
sudo reboot
fi
