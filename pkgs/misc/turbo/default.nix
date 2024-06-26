{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  file,
  tvision,
}:

stdenv.mkDerivation {
  pname = "turbo";
  version = "0-unstable-2024-02-05";

  src = fetchFromGitHub {
    owner = "magiblot";
    repo = "turbo";
    rev = "3251358bb06e277309b9ae678f1c88c315c7f856";
    hash = "sha256-5EdVrzu9MxXTfQSfenjPQJ8pBizRAhhAAxyA3aObCvU=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    file # libmagic
    tvision
  ];

  cmakeFlags = [ (lib.cmakeBool "TURBO_USE_SYSTEM_TVISION" true) ];

  meta = {
    description = "An experimental text editor based on Scintilla and Turbo Vision";
    homepage = "https://github.com/magiblot/turbo";
    license = lib.licenses.free;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = lib.platforms.unix;
  };
}
