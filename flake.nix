{
  description = "A spindrift consumer — headless Claude Code agents in nix-built, disposable containers, one per GitHub issue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    spindrift.url = "github:jordansmall/spindrift";
  };

  outputs =
    inputs@{
      flake-parts,
      spindrift,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];

      imports = [ spindrift.flakeModules.default ];

      perSystem =
        { config, pkgs, ... }:
        {
          spindrift = {

            packages = p: [ p.neovim ];

            prefetch = "nvim --headless '+Lazy! sync' +qa";

            prompt = builtins.readFile ./prompts/issue-prompt.md;

            settings = {
              repository = {
                codeForge = "github";
                repoSlug = "codymikol/nvim";
                gitUserName = "bot";
                gitUserEmail = "hi@codymikol.com";
              };
            };
          };

          devShells.default = pkgs.mkShell {
            packages = [ config.packages.spindrift ];
          };

        };
    };
}
