# Documentation: https://nixos.wiki/wiki/Flakes
# Documentation: https://yuanwang.ca/posts/getting-started-with-flakes.html
{
  description = "NixOS docker image";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        #pkgs = nixpkgs.legacyPackages.${system};
        pkgs = import nixpkgs { 
          inherit system;
          config.allowUnfree = true;
        };

      in
      rec {
        # Development environment: nix develop
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            cargo
            claude-code
            claude-agent-acp
          ];
        };
      }
    );
}
