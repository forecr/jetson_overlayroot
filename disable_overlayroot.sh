#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

function disable_overlayroot_l4t_R32 {
	if test -f "/etc/overlayroot.conf"; then
		if ! overlayroot-chroot /bin/bash -c "echo 'overlayroot=disabled' > /etc/overlayroot.conf"; then
			echo "ERR: could not run command in overlayrootfs, is it already disabled?"
		else
			echo "Overlay root file-system will be disabled on next boot."
		fi
	else
		echo "/etc/overlayroot.conf not found"
	fi
}

if [ "$(cat /etc/nv_tegra_release | grep -c '# R32 (release)')" == "1" ]; then
	echo "JetPack-4.x based system detected"
	disable_overlayroot_l4t_R32
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
