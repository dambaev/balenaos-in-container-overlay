{ stdenv, pkgs, fetchzip, fetchpatch, fetchgit, fetchurl }:
stdenv.mkDerivation {
  name = "balenaos-in-container";

  src = fetchgit {
      url = "https://github.com/balena-os/balenaos-in-container.git";
      rev = "adf4f77385ef12203c2603b8ba262ee08fbf10a0";
      sha256 = "0mcyh5896a3frxqlkzqbdkskrpc5czgpkzcc12czmy9y7xvyy3ci";
    };
  buildInputs = with pkgs;
  [ 
  ];
  installPhase = ''
    mkdir -p $out
    cp aufs2overlay.sh $out
    cp -r conf $out
    cp balenaos-in-container.sh $out
  '';
}
