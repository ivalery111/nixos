# Apply configuration
```
$ nixos-rebuild switch
$ nix-collect-garbage -d
$ nixos-rebuild switch # removes now unused boot loader entries
$ reboot
```

# Usefull links
- https://citizen428.net/blog/installing-nixos-raspberry-pi-3/
