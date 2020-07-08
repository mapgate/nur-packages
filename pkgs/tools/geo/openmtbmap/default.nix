{ stdenv, gmaptool, mkgmap, p7zip, zsh, sources, substituteAll }:

stdenv.mkDerivation {
  pname = "openmtbmap";
  version = stdenv.lib.substring 0 7 sources.openmtbmap.rev;
  src = sources.openmtbmap;

  patches = (substituteAll {
    src = ./0001-fix-path.patch;
    inherit gmaptool mkgmap p7zip;
  });

  buildInputs = [ zsh ];

  installPhase = ''
    install -Dm755 create_omtb_garmin_img.sh $out/bin/create_omtb_garmin_img
  '';

  meta = with stdenv.lib; {
    inherit (src) description homepage;
    license = licenses.free;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.all;
    skip.ci = true;
  };
}
