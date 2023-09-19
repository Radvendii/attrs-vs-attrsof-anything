{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, nixpkgs }: {

    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ({lib, ... }: {

        options = {
          attrs = lib.mkOption {
            type = lib.types.attrs;
          };
          attrsOf = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
          };
        };

        config = {
          attrs.a.b = lib.mkDefault 1;
          attrsOf.a.b = lib.mkDefault 1;
        };

      })];
    };

  };
}
