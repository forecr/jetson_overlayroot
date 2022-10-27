#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

if test -f "/etc/overlayroot.conf"; then
	echo 'overlayroot_cfgdisk="disabled"' > /etc/overlayroot.conf
	echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.conf
	echo "Overlay root file-system will be enabled on next boot."
else
	echo "/etc/overlayroot.conf not found"
fi
