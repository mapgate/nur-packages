{ stdenv, mkYarnPackage, sources, secretsConfig ? null }:

mkYarnPackage rec {
  name = "nakarte-${stdenv.lib.substring 0 7 src.rev}";
  src = sources.nakarte;
  packageJSON = "${src}/package.json";
  yarnLock = "${src}/yarn.lock";

  postPatch =
    if (secretsConfig != null) then
      "cp ${builtins.toFile "secrets.js" secretsConfig} src/secrets.js"
    else
      "cp src/secrets.js.template src/secrets.js";

  buildPhase = "yarn build";

  installPhase = ''
    install -dm755 $out/share/nginx
    mv deps/nakarte/build $out/share/nginx/html
  '';

  distPhase = "true";

  meta = with stdenv.lib; {
    inherit (src) description homepage;
    license = licenses.mit;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.all;
  };
}
