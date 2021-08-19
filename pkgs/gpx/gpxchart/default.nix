{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gpxchart";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "tkrajina";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-3HDj4k5mSUrJOxN2DrsHjMtX8PylxHExJeMc5CuaPP8";
  };

  vendorSha256 = null;

  doCheck = false;

  meta = with lib; {
    description = "A command-line tool and library for elevation charts from GPX files";
    inherit (src.meta) homepage;
    license = licenses.asl20;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
