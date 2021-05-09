{ config, pkgs, ... }:
{
	imports = [
      ./kboot-conf
    ];
	boot.loader.grub.enable = false;
	boot.loader.kboot-conf.enable = true;
	boot.kernelParams = [ "console=ttyAML0,115200n8" ];
	boot.consoleLogLevel = 7;
	# need latest kernel for the n2+ device tree blob
	boot.kernelPackages = pkgs.linuxPackages_latest;
	hardware.deviceTree.name = "amlogic/meson-g12b-odroid-n2-plus.dtb";
}
