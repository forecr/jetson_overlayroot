#!/bin/bash -u
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

# Check GtkTerm installed
REQUIRED_PKG="overlayroot"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo "Checking for $REQUIRED_PKG: $PKG_OK"
if [ "" = "$PKG_OK" ]; then
	echo ""
	echo "$REQUIRED_PKG not found. Setting it up..."
	sudo apt update
	sudo apt-get --yes install $REQUIRED_PKG 

	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
	echo ""
	echo "Checking for $REQUIRED_PKG: $PKG_OK"

	if [ "" = "$PKG_OK" ]; then
		echo ""
		echo "$REQUIRED_PKG not installed. Please try again later"
		exit 1
	fi

fi

# Get the default config file's backup
cp /etc/overlayroot.conf /etc/overlayroot_default.conf


tempdir=$(mktemp -d)
trap "rm -r $tempdir" EXIT

if [ ! -f /boot/initrd.orig ]; then
  /bin/cp -p /boot/initrd /boot/initrd.orig
fi

/bin/zcat /boot/initrd.orig |(cd $tempdir; /bin/cpio -id)

(cd $tempdir; /bin/cp -p /bin/kmod bin)
(cd $tempdir; /bin/ln -s /bin/kmod sbin/modprobe)
(cd $tempdir; /bin/ln -s /bin/kmod sbin/lsmod)
(cd $tempdir; /bin/ln -s /bin/kmod sbin/insmod)
(cd $tempdir; /bin/cp -p /bin/uname bin)
(cd $tempdir; /bin/cp -p /bin/dash bin)
(cd $tempdir; /bin/ln -s /bin/dash bin/sh)

(cd $tempdir; /bin/mkdir scripts)
(cd $tempdir; /bin/cp -p /usr/share/initramfs-tools/scripts/functions scripts)
(cd $tempdir; /bin/cp -p /usr/share/initramfs-tools/scripts/init-bottom/overlayroot scripts)
/bin/cp scripts/overlayroot-jetpack $tempdir/scripts

/bin/cat patch/init.patch |(cd $tempdir; /usr/bin/patch)

(cd $tempdir; /usr/bin/find . |/bin/cpio -R 0:0 -o -H newc) |/bin/gzip > /boot/initrd

echo "Done."
