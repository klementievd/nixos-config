{ lib, pkgs, fetchzip }:

let
in fetchzip {
  name = "silkscreen";

  url = "https://media.fontsgeek.com/download/zip/s/i/silkscreen-regular_0JTIE.zip";

  sha256 = "sha256-KpKC+SGwf/TuQe3gCzTw7UE7rSHVosW5Fru9ehvs5Lw=";

  meta = with lib; {
    homepage = "https://rsms.me/inter/";
    description = "A typeface specially designed for user interfaces";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ demize dtzWill ];
  };
}
