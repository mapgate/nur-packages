{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  check,
  libconfig,
  libiio,
  volk,
  protobufc,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "sdr-modem";
  version = "1.0.126";

  src = fetchFromGitHub {
    owner = "dernasherbrezon";
    repo = "sdr-modem";
    rev = finalAttrs.version;
    hash = "sha256-j3T8LJq7B4GL41tAr6RfDla9hu2+BQTVTi96LnEo0iw=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    check
    libconfig
    libiio
    volk
    protobufc
  ];

  installPhase = ''
    install -Dm755 sdr_modem -t $out/bin
    install -Dm644 $src/src/resources/config.conf -t $out/etc
  '';

  meta = {
    description = "Modem based on software defined radios";
    homepage = "https://github.com/dernasherbrezon/sdr-modem";
    license = lib.licenses.gpl2;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = lib.platforms.unix;
  };
})
