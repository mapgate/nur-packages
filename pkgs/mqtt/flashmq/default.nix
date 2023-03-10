{ lib, stdenv, fetchFromGitHub, cmake, installShellFiles, openssl }:

stdenv.mkDerivation rec {
  pname = "flashmq";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "halfgaar";
    repo = "FlashMQ";
    rev = "v${version}";
    hash = "sha256-VikTaPczF1+Bk/K6D5lZgyLybNETtm0YTEwFgPmpiiw=";
  };

  nativeBuildInputs = [ cmake installShellFiles ];

  buildInputs = [ openssl ];

  installPhase = ''
    install -Dm755 flashmq -t $out/bin
    installManPage $src/man/*.{1,5}
  '';

  meta = with lib; {
    description = "Fast light-weight MQTT broker/server";
    homepage = "https://www.flashmq.org/";
    license = licenses.agpl3;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.linux;
    skip.ci = stdenv.isDarwin;
  };
}
