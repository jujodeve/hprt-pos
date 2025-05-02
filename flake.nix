{
  description = "CUPS drivers for HPRT POS thermal printers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Or your preferred channel
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgName = "hprt-pos";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {

        name = pkgName;
        version = "1.0";
        system = "x86_64-linux";
        src = self;

        nativeBuildInputs = [
          pkgs.autoPatchelfHook
        ];

        buildInputs = with pkgs; [
          cups
          glibc
          gcc-unwrapped
        ];

        installPhase = ''
          install -d -m 777 $out/share/cups/model/hprtpos/
          install -m 644 ppd/*.ppd $out/share/cups/model/hprtpos/
          install -m 755 -D filter/x64/raster-esc $out/lib/cups/filter/raster-esc
        '';
      };

      # Overlay
      overlays.default = final: prev: {
        ${pkgName} = self.packages.${prev.system}.default;
      };
    };
}
