/*
X570AM - Full AMD entertainment / gaming system.

Gigabyte X570 Aorus Master motherboard
AMD Ryzen 9 5950X processor
AMD Radeon RX 6900XT graphics card
32 GB RAM
Multiple NVMe drives and one SSD

Should contain gaming related apps and services like Steam, Lutris, Wine.
Created with multi monitor setup in mind.
*/
{
  inputs,
  lib,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    # Allow SMBus access for OpenRGB device interaction
    kernelParams = [];
    kernelModules = [];
  };

  # Host specific user packages
  home.packages = [
    # multimedia
    pkgs.gimp
    pkgs.drawing
    # utils
    pkgs.neofetch
  ];

  modules = {
    device = {
      cpu = "amd";
      gpu = "nouveau";
      drive = "nvme"; # where the os is installed
      supportsBrightness = true;
      supportsBluetooth = true;
      monitors = {
        main = {
          x11_name = "DP-1";
          wayland_name = "DP-1";
          resolution = "1920x1080";
          position = {
            x = 0;
            y = 0;
          };
          refresh_rate = 165;
          adaptive_sync = false;
          primary = true;
        };
        side = {
          x11_name = "HDMI-1";
          wayland_name = "HDMI-1";
          resolution = "1920x1080";
          position = {
            x = 1920;
            y = 0;
          };
          refresh_rate = 60;
          adaptive_sync = false;
        };
      };
    };
    shell = {
      git.enable = true;
      gpg.enable = true;
      passwords.enable = true;
    };
    hardware.network = {
      networkmanager.enable = false;
      connman.enable = true;
    };
    services.greetd.enable = true;
    desktop = {
      sway.enable = true;
      gaming.enable = true;
      util.mpv.enable = true;
      util.rofi.enable = true;
      apps = {
        browsers.firefox.enable = true;
        alacritty.enable = true;
        discord.enable = true;
        neovim.enable = true;
        thunar.enable = true;
        vscode.enable = true;
        zathura.enable = true;
      };
    };
  };
}
