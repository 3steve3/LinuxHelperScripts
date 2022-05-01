#!/bin/sh
if [[ "$EUID" != 0 ]]; then
	echo "Run as root"
	exit
else
sudo systemctl stop snapd && sudo systemctl disable snapd
sudo apt autoremove --purge snapd gnome-software-plugin-snap
rm -fr ~/snap
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd /root/snap
sudo apt-mark hold snapd
fi
