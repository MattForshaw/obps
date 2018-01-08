with import <nixpkgs> {};
let 
 texlive = pkgs.texlive.combine {
      inherit (pkgs.texlive)
      everypage
      scheme-full
      xkeyval
      background
      times
      courier
      wrapfig
      xcolor
      booktabs
      caption
      siunitx
      fixme
      todo
      tabulary
      algorithms
      algorithmicx
      acmart
      totpages
      environ
      trimspaces
      ncctools
      comment
      dirtree ;
  };
  callPackage = pkgs.lib.callPackageWith (pkgs);
in
stdenv.mkDerivation rec {
  name="paper";
  src = ./.;
  buildPhase = ''
    make
  '';
  installPhase = ''
    mkdir $out
    cp paper.pdf $out
    '';
  buildInputs = [ texlive pkgs.dia ];
}
