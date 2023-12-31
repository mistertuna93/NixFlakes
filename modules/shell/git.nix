# Configuration for Git
{
  config,
  options,
  lib,
  ...
}: let
  gitConfig = config.modules.shell.git;
in {
  options.modules.shell.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    userName = lib.mkOption {
      type = lib.types.str;
      default = "mistertuna93";
    };
    userEmail = lib.mkOption {
      type = lib.types.str;
      default = "charles.staub93@gmail.com";
    };
    signingKey = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config = lib.mkIf (gitConfig.enable) {
    # home manager configuration
    home.manager.programs.git = {
      enable = true;
      userName = gitConfig.userName;
      userEmail = gitConfig.userEmail;
      signing = {
        key = gitConfig.signingKey;
        signByDefault = false;
      };
      ignores = ["/.vscode" "/.pio" "/__pycache__" ".envrc" ".direnv"];
      delta.enable = true;
    };
  };
}
