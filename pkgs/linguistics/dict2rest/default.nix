{
  lib,
  fetchFromGitHub,
  buildGoPackage,
}:

buildGoPackage {
  pname = "dict2rest";
  version = "0-unstable-2016-12-05";

  src = fetchFromGitHub {
    owner = "felix";
    repo = "go-dict2rest";
    rev = "b049991a46a2f619344bd6e915745703864d0134";
    hash = "sha256-v5vBsdGQZYHSPEiBgSezKqaev1sTXnP27Tn47z1ebjQ=";
  };

  goPackagePath = "github.com/felix/go-dict2rest";

  meta = {
    description = "A simple proxy service providing an HTTP interface to a Dict protocol (RFC 2229) server";
    homepage = "https://github.com/felix/go-dict2rest";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = lib.platforms.unix;
    mainProgram = "go-dict2rest";
  };
}
