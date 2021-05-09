# NixOS on ODROID-N2

These are configuration files which make it easier to set up and maintain a NixOS installation on an ODROID-N2+ single-board computer.

The system is set up to be loaded through Petitboot, which means the physical boot switch on the board must be in the 'SPI' position (the ODROID's are shipped with Petitboot installed in the internal SPI flash memory). Petitboot reads kernel path and boot options from a `/kboot.conf` file.

Kernel is mainline.

Patches are welcome!

## Building an initial SD/MMC image

On an aarch64 system (or with aarch64 emulation):

    nix-build '<nixos/nixos>' -I nixos-config=./sd-image.nix -A config.system.build.sdImage

## First configuration

After flashing the image and booting it up on the ODROID:

    nixos-generate-config # populates /etc/nixos/ with empty configuration
    nix-env -iA nixos.gitFull
    cd /etc/nixos
    git clone https://github.com/povik/nixos-on-odroid-n2.git

    # add ./nixos-on-odroid-n2 as an import in configuration.nix, modify the configuration in other ways

    nixos-rebuild switch

...and you are set!

## Known Bugs

 * Reboots seem not to work. The system shuts down but then it's stuck and does not restart.
