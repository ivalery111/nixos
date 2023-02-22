{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:rycee/home-manager/release-22.11";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in
  {
    devShell.${system} = import ./shell.nix { inherit pkgs; };
    nixosConfigurations = {
      fw = nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        modules = [
          ./hosts/fw
          nixos-hardware.nixosModules.framework
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.valery = import ./hosts/fw/modules.nix;
          }
        ];
      };
      rpi = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hosts/rpi
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.valery = import ./hosts/rpi/modules.nix;
          }
        ];
      };
    };
  };
}
