{ config, pkgs, ... }:

{
	# TODO please change the username & home directory to your own
	home.username = "zwelch";
	home.homeDirectory = "/home/zwelch";

	programs.git = {
		enable = true;
		userName = "Sven Engels";
		userEmail = "zwelchmobile@googlemail.com";
	};

	home.packages = with pkgs; [
		neofetch
		eza
	];

 	home.stateVersion = "23.05";
  
	programs.home-manager.enable = true;
}
