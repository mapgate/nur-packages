{ lib, buildGoModule, fetchFromSourcehut, scdoc }:

buildGoModule rec {
  pname = "gmnitohtml";
  version = "2021-05-08";

  src = fetchFromSourcehut {
    owner = "~adnano";
    repo = pname;
    rev = "332368e55341b8de44eecd5abe128d4a4b6a3087";
    hash = "sha256-iYN6DGYMsLSbkAWRr7KygkgxxDuoFqopxwr9gfiiC+0=";
  };

  nativeBuildInputs = [ scdoc ];

  vendorSha256 = "sha256-Cx8x8AISRVTA4Ufd73vOVky97LX23NkizHDingr/zVk=";

  buildPhase = ''
    runHook preBuild
    # we use make instead of go build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make PREFIX=$out install
    runHook postInstall
  '';

  meta = with lib; {
    description = "Gemini text to HTML converter";
    inherit (src.meta) homepage;
    license = licenses.mit;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
