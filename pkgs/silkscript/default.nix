{ lib, fetchzip }:

let
in fetchzip {
  name = "silkscript";

  url = "https://www.fontsquirrel.com/fonts/download/Silkscreen";

  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j $downloadedFile \*.otf -d $out/share/fonts/opentype
  '';

  sha256 = "sha256-8p15thg3xyvCA/8dH2jGQoc54nzESFDyv5m47FgWrSI=";

  meta = with lib; {
    homepage = "https://rsms.me/inter/";
    description = "A typeface specially designed for user interfaces";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ demize dtzWill ];
  };
}
