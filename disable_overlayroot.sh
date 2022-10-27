#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

if test -f "/etc/overlayroot.conf"; then
	if ! overlayroot-chroot /bin/bash -c "echo 'overlayroot=disabled' > /etc/overlayroot.conf"; then
		echo "ERR: could not run command in overlayrootfs, is it already disabled?"
	else
		echo "Overlay root file-system will be disabled on next boot."
	fi
else
	echo "/etc/overlayroot.conf not found"
fi


