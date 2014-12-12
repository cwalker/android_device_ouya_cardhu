#!/system/bin/sh
if [ -h "/dev/block/platform/sdhci-tegra.3/by-name/UPP" ]; then
	echo "OUYA MAC system" > /data/misc/bluetooth/history.log
	mkdir -p /data/misc/bluetooth
	unimac read bt
	if [ $? == 0 ] ; then
		echo "OUYA MAC system" >> /data/misc/bluetooth/history.log
		unimac read bt > /data/misc/bluetooth/bdaddr
	else
		echo "ORG MAC system" >> /data/misc/bluetooth/history.log
		/system/bin/btmacwriter
	fi
else 
	echo "ORG MAC system" > /data/misc/bluetooth/history.log
	/system/bin/btmacwriter
fi
