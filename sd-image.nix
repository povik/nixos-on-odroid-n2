{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/base.nix")
    (modulesPath + "/profiles/installation-device.nix")
    (modulesPath + "/installer/cd-dvd/sd-image.nix")
    ./default.nix
  ];
  sdImage = {
    populateFirmwareCommands = let
      configTxt = pkgs.writeText "README" ''
        Nothing to see here. This empty partition is here because I don't know how to turn its creation off.
      '';
      in ''
        cp ${configTxt} firmware/README
      '';
    populateRootCommands = ''
      ${config.boot.loader.kboot-conf.populateCmd} -c ${config.system.build.toplevel} -d ./files/kboot.conf
    '';
  };
  # do not copy /etc/nixos/configuration.nix into the image
  installer.cloneConfig = false;
}
