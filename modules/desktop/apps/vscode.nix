# Configuration for Visual Studio Code
{
  config,
  options,
  lib,
  pkgs,
  ...
}: let
  codeConfig = config.modules.desktop.apps.vscode;
  fontStyles = config.modules.desktop.themes.fonts.styles;
in {
  options.modules.desktop.apps.vscode = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.vscode;
    };
  };

  config = lib.mkIf (codeConfig.enable) {
    modules.desktop.defaultApplications.apps.ide = {
      package = codeConfig.package;
      install = false; # installed by home manager
      cmd = "${codeConfig.package}/bin/code";
      desktop = "code";
    };

    # home manager configuration
    home.manager.programs.vscode = {
      enable = true;
      userSettings = with builtins; fromJSON (readFile ./_files/settings.json);
      package = pkgs.vscodium.fhs;
      extensions = let
        vscext = pkgs.vscode-extensions;
      in [
        vscext.ms-vscode.cpptools
        vscext.twxs.cmake
        vscext.ms-python.python
        vscext.ms-python.vscode-pylance
        vscext.haskell.haskell
        vscext.justusadam.language-haskell
        vscext.jnoortheen.nix-ide
        vscext.kamadorueda.alejandra
        vscext.james-yu.latex-workshop
        vscext.redhat.vscode-yaml
        vscext.esbenp.prettier-vscode
        vscext.pkief.material-icon-theme
        vscext.github.github-vscode-theme
        vscext.mkhl.direnv
        vscext.sumneko.lua
      ];
      mutableExtensionsDir = false;
    };
  };
}
