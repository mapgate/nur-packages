{
  lib,
  stdenv,
  fetchurl,
  routino,
  osm-extracts,
  prefix ? "Russia-NWFD",
}:

stdenv.mkDerivation {
  pname = "routinodb";
  inherit (osm-extracts) version;

  dontUnpack = true;

  nativeBuildInputs = [ routino ];

  installPhase = ''
    install -dm755 $out

    for region in RU-{ARK,KO,KR,LEN,MUR,NEN,NGR,PSK,SPE,VLG}; do
      planetsplitter \
        --dir=$out \
        --prefix=${prefix} \
        --tagging=${routino}/share/routino/tagging.xml \
        --parse-only --append ${osm-extracts}/$region.osm.pbf
    done

    planetsplitter \
      --dir=$out \
      --prefix=${prefix} \
      --tagging=${routino}/share/routino/tagging.xml \
      --process-only
  '';

  meta = {
    description = "Routino Database";
    license = lib.licenses.free;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = lib.platforms.all;
    skip.ci = true;
  };
}
