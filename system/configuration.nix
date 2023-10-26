{ config, pkgs, helix, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    	experimental-features = nix-command flakes
  '';

  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      devices = [ "nodev" ];
      efiSupport = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "zwelchnix"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de";
  };

  services.xserver.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  users.users.zwelch = {
    isNormalUser = true;
    initialPassword = "pw";
    extraGroups = [ "networkmanager ""wheel" ]; # Enable ‘sudo’ for the user.
  };

  nix.settings.trusted-users = [ "zwelch" ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    nixpkgs-fmt
  ];

  networking.firewall.enable = false;

  system.stateVersion = "23.05"; # Did you read the comment?
}

