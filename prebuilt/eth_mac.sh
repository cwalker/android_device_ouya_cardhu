#!/system/bin/sh

if [ -h "/dev/block/platform/sdhci-tegra.3/by-name/UPP" ]; then
	if [ $? == 0 ]; then
		netcfg eth0 down hwaddr $(unimac read eth)
    fi
fi


