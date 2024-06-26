{
  lib,
  stdenv,
  fetchfromgh,
  unzip,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "Amethyst";
  version = "0.20.0";

  src = fetchfromgh {
    owner = "ianyh";
    repo = "Amethyst";
    version = "v${finalAttrs.version}";
    name = "Amethyst.zip";
    hash = "sha256-GYorvoCDLOd/xYStIGkSBqF5QjVR3PHL30b/Hm+CnAk=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ unzip ];

  installPhase = ''
    mkdir -p $out/Applications
    cp -r *.app $out/Applications
  '';

  preferLocalBuild = true;

  meta = {
    description = "Automatic tiling window manager for macOS à la xmonad";
    homepage = "https://ianyh.com/amethyst/";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.sikmir ];
    platforms = [ "x86_64-darwin" ];
    skip.ci = true;
  };
})
