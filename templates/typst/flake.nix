{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux; mkShell {
      packages = [ typst typst-live ];
      shellHook = ''
          unset SOURCE_DATE_EPOCH
      '';
    };

  };
}
