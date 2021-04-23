{ lib, fetchFromGitHub, python3Packages, geotiler }:

python3Packages.buildPythonApplication {
  pname = "cmpgpx";
  version = "2015-06-05";

  src = fetchFromGitHub {
    owner = "jonblack";
    repo = "cmpgpx";
    rev = "ec3ff781da9b7bcbc2dee44a3bd641cbd5005efe";
    sha256 = "1fq215a8xa2q3nppab162dabs4nxyh0x2sd631k40gn3n14s75l8";
  };

  propagatedBuildInputs = with python3Packages; [ cairocffi geotiler gpxpy numpy ];

  dontUseSetuptoolsBuild = true;
  dontUseSetuptoolsCheck = true;

  installPhase = ''
    install -Dm644 geo.py gfx.py -t $out/lib/${python3Packages.python.libPrefix}/site-packages
    install -Dm755 cmpgpx.py $out/bin/cmpgpx
    install -Dm755 dist.py $out/bin/dist
  '';

  meta = with lib; {
    description = "Show the differences between GPX files";
    inherit (src.meta) homepage;
    license = licenses.unlicense;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
