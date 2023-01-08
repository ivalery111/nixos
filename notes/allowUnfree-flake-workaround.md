- allowUnfree workaround with flake
```
$ sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake '.#fw' --impure
```
