{pkgs ? import <nixpkgs> {} }:
let
  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);
  self = rec {
    zymake = pkgs.ocamlPackages.callPackage pkgs/zymake { };
    obandit = pkgs.ocamlPackages.callPackage obandit/obandit.nix {};
    ocs = pkgs.ocamlPackages.callPackage pkgs/ocs { inherit obandit; };
    banditSelection=pkgs.stdenv.mkDerivation rec {
      name = "banditSelection";
      src = ./.;
      buildInputs =
      [
        zymake
        ocs
        pkgs.pythonPackages.docopt
        pkgs.R
        pkgs.rPackages.docopt
        pkgs.rPackages.ggplot2
        pkgs.rPackages.dplyr
        pkgs.rPackages.lubridate
        pkgs.rPackages.directlabels
        pkgs.rPackages.ggmosaic
        pkgs.bc
      ];
      #configurePhase = ''rm -rf o'';
      buildPhase = ''
        patchShebangs ./misc/strong_filter
        #patchShebangs ./src/global_metrics.R
        patchShebangs ./misc/visu/cumobj_diff.R
        patchShebangs ./misc/visu/average_cumobj.R
        patchShebangs ./misc/visu/mosaic.R
        patchShebangs ./misc/extract_maxprocs.py
        zymake -l localhost zymakefile
        '';
      installPhase = ''
        mkdir -p $out/pdfs/
        mv o/zymakefile/*.pdf $out/pdfs
        '';
    };
  };
in
  self
