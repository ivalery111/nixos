nix-shell template:
```
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    hello
  ];
}
```

Example of use:
```
$ nix-shell hello.nix
```
