{ lib, stdenv, fetchgit, libressl, libbsd }:

stdenv.mkDerivation rec {
  pname = "hurl";
  version = "0.5";

  src = fetchgit {
    url = "git://git.codemadness.org/${pname}";
    rev = version;
    sha256 = "06kxrl97mdhfg9hbrh69r41z7mr8fmphxyl1m16rh3imy99szv90";
  };

  buildInputs = [ libressl libbsd ];

  NIX_LDFLAGS = "-lbsd";

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Relatively simple HTTP, HTTPS and Gopher client/file grabber";
    homepage = "https://git.codemadness.org/hurl/file/README.html";
    license = licenses.isc;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.linux;
    skip.ci = stdenv.isDarwin;
  };
}
