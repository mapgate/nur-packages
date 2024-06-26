{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "maptourist";
  version = "2024-01-26";

  src = fetchurl {
    url = "https://maptourist.org/osm-garmin/archive/OSM-MapTourist-Russia-gmapsupp-RU_${version}.zip";
    hash = "sha256-2NWJwXIaCYgKjdMzpB5DGCAeWoyWMqKtjRR+C/P1ZLA=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ unzip ];

  installPhase = "install -Dm644 *.img -t $out";

  preferLocalBuild = true;

  meta = {
    description = "Ежедневная сборка карт из данных OpenStreetMap для навигационных приборов и приложений Garmin";
    homepage = "https://maptourist.org";
    license = lib.licenses.free;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = lib.platforms.all;
    skip.ci = true;
  };
}
