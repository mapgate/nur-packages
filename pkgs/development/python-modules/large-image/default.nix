{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonPackage rec {
  pname = "large-image";
  version = "1.25.0";

  src = fetchFromGitHub {
    owner = "girder";
    repo = "large_image";
    rev = "v${version}";
    hash = "sha256-JJKQ5Dt4T5I4iy2ghUo7URtCNzZKncAih9KSo/6nzbQ=";
  };

  build-system = with python3Packages; [ setuptools-scm ];

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  propagatedBuildInputs = with python3Packages; [
    cachetools
    palettable
    pillow
    psutil
    numpy
  ];

  doCheck = false;

  meta = {
    description = "Python modules to work with large multiresolution images";
    homepage = "http://girder.github.io/large_image/";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.sikmir ];
    broken = true;
  };
}
