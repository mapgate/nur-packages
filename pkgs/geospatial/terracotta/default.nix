{
  lib,
  fetchFromGitHub,
  python3Packages,
}:

python3Packages.buildPythonApplication rec {
  pname = "terracotta";
  version = "0.8.4";

  src = fetchFromGitHub {
    owner = "DHI-GRAS";
    repo = "terracotta";
    rev = "refs/tags/v${version}";
    hash = "sha256-kRix66bnqvVKC6yjsrXDp1bEy4Sh9DJIvCKv0o01HCs=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace-fail "\"setuptools_scm_git_archive\"," ""
  '';

  build-system = with python3Packages; [
    setuptools-scm
    #setuptools-scm-git-archive
  ];

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  dependencies = with python3Packages; [
    apispec
    apispec-webframeworks
    cachetools
    click
    click-spinner
    flask
    flask-cors
    marshmallow
    mercantile
    numpy
    pillow
    pyyaml
    shapely
    sqlalchemy
    rasterio
    toml
    tqdm
  ];

  doCheck = false;

  nativeCheckInputs = with python3Packages; [ pytestCheckHook ];

  meta = {
    description = "A light-weight, versatile XYZ tile server";
    homepage = "https://github.com/DHI-GRAS/terracotta";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.sikmir ];
  };
}
