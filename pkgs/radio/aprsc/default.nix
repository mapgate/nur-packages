{ lib, stdenv, fetchFromGitHub, fetchpatch, perl, libevent, openssl }:

stdenv.mkDerivation rec {
  pname = "aprsc";
  version = "2.1.10";

  src = fetchFromGitHub {
    owner = "hessu";
    repo = pname;
    rev = "release/${version}";
    hash = "sha256-47adSt3NBFr7UtZfoB44iNhM2EtiMk0mMeXHWgvi1UI=";
  };

  patches = (fetchpatch {
    url = "https://raw.githubusercontent.com/freebsd/freebsd-ports/54cc4cc6eaed14e3d495ca3a3b6f86f3f429b991/net/aprsc/files/patch-Makefile.in";
    sha256 = "sha256-lxnE/9fgnxZxIcb9bNcq4PoOIBntIdyVYJa5rPIx26s=";
  });

  patchFlags = [ "-p0" ];

  postPatch = ''
    substituteInPlace Makefile.in \
      --replace "(DESTDIR)\$(MANDIR)" "(DESTDIR)\$(PREFIX)\$(MANDIR)" \
      --replace "SRCVERSION:=\$(GITVERSION)" "SRCVERSION:=gd72a17c"
  '';

  sourceRoot = "${src.name}/src";

  nativeBuildInputs = [ perl ];

  buildInputs = [ libevent openssl ];

  preConfigure = "LD=$CC";
  configureFlags = [ "--sbindir=/bin" "--with-openssl" ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "A core APRS-IS server";
    homepage = "http://he.fi/aprsc/";
    license = licenses.bsd3;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.linux;
    skip.ci = stdenv.isDarwin;
  };
}
