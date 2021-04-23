{ lib, buildGoModule, fetchFromSourcehut }:

buildGoModule rec {
  pname = "gssg";
  version = "2020-12-08";

  src = fetchFromSourcehut {
    owner = "~gsthnz";
    repo = pname;
    rev = "747b6b41fbe93f0b408a58c8e6a1f11c7945c819";
    hash = "sha256-yMWj3wHSq4KZ2ezECBpCXhgqlpIm2zSe0sZP8OxNLIw=";
  };

  vendorSha256 = "188v7nax3yss7hqin41mjin8inkh6q7bv8pmbls2dwd809pxj5rp";

  meta = with lib; {
    description = "A gemini static site generator";
    inherit (src.meta) homepage;
    license = licenses.gpl3Only;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
