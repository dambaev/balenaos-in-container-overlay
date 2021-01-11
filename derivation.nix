{ stdenv, pkgs, fetchzip, fetchpatch, fetchgit, fetchurl }:
stdenv.mkDerivation {
  name = "balenaos-in-container";

  src = fetchgit {
      url = "https://github.com/balena-os/balenaos-in-container.git";
      rev = "adf4f77385ef12203c2603b8ba262ee08fbf10a0";
      sha256 = "0mcyh5896a3frxqlkzqbdkskrpc5czgpkzcc12czmy9y7xvyy3ci";
    };
  buildInputs = with pkgs;
  [ gnused
  ];
  buildPhase = ''
    sed -i 's/set -e/set -ex/' balenaos-in-container.sh
    sed -i 's/\$(cd "\$(dirname "\$0")" ; pwd)/\$(cd "\$(dirname "\$(readlink -f \$0)")" ; pwd)/' balenaos-in-container.sh
    patchShebangs balenaos-in-container.sh
  '';
  dontPatchShebangs = true;
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share
    cp aufs2overlay.sh $out/share
    cp -r conf $out/share/
    cp balenaos-in-container.sh $out/share/
    ln -s $out/share/balenaos-in-container.sh $out/bin/
  '';
}
