{
  inputs = {
    # nixos-unstable provides latest packages while being somewhat
    # stable despite its name.
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs.lib) genAttrs attrValues;
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    eachSystem = f: genAttrs systems (arch: f nixpkgs.legacyPackages.${arch});
  in {
    # Development shells go here
    devShells = eachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = attrValues {
          # Packages here
        };
      };
    });

    # Packages go here
    packages = eachSystem (pkgs: {
      # Write your own packages here, however you should
      # probably move packaging to their own files as derivations
      # can get quite messy.
    });

    # Formatter
    formatter = eachSystem (pkgs: pkgs.nixfmt-rfc-style);
  };
}
