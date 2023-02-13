
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = inputs:
    with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.blog = pkgs.stdenv.mkDerivation {
          pname = "blog";
          version = "22.02.13";
          src = ./blog;
          nativeBuildInputs = [ pkgs.zola ];
          buildPhase = "zola build";
          installPhase = "cp -r public $out";
        };
        defaultPackage = self.packages.${system}.blog;
        devShell = pkgs.mkShell { nativeBuildInputs = [ pkgs.zola ]; }; 
      });
}
    
