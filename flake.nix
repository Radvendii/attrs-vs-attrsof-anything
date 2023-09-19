{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, nixpkgs }: {

    nixosConfigurations.uh-oh = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({lib, ... }: {
          options.foo = lib.mkOption {
            type = lib.types.attrs;
          };
          config.foo = { a = { b = lib.mkDefault 1; }; };
        })
      ];
    };

    nixosConfigurations.no-problem = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({lib, ... }: {
          options.foo = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
          };
          config.foo = { a = { b = lib.mkDefault 1; }; };
        })
      ];
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
