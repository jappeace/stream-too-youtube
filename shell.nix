{ pkgs ? import ./pin.nix }:
let 
    # this shell provides us a fast build setup
    # default.nix is generated by hpack & cabal2nix
    origBuild = import ./default.nix { };
    wTools = pkgs.haskell.lib.overrideCabal origBuild (drv: {
      libraryToolDepends = [
        pkgs.ghcid 
        pkgs.cabal-install
        pkgs.haskellPackages.hasktags
        pkgs.haskellPackages.c2hs
        pkgs.ffmpeg
        pkgs.hlint
        pkgs.pocketsphinx
        pkgs.pkg-config
        pkgs.cabal2nix 
        pkgs.haskellPackages.hpack
        ];
    });
in 
wTools.env
