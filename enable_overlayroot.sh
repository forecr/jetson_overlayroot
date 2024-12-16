#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

function enable_overlayroot_l4t_R32 {
	if test -f "/etc/overlayroot.conf"; then
		echo 'overlayroot_cfgdisk="disabled"' > /etc/overlayroot.conf
		echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.conf
		echo "Overlay root file-system will be enabled on next boot."
	else
		echo "/etc/overlayroot.conf not found"
	fi
}

if [ "$(cat /etc/nv_tegra_release | grep -c '# R32 (release)')" == "1" ]; then
	echo "JetPack-4.x based system detected"
	enable_overlayroot_l4t_R32
elif [ "$(cat /etc/nv_tegra_release | grep -c '# R35 (release)')" == "1" ]; then
	echo "JetPack-5.x based system detected"
	echo "Unsupported system"
	exit 1
elif [ "$(cat /etc/nv_tegra_release | grep -c '# R36 (release)')" == "1" ]; then
	echo "JetPack-6.x based system detected"
	echo "Unsupported system"
	exit 1
else
	echo "Could not detect the JetPack version"
	exit 1
fi

echo "Done."
