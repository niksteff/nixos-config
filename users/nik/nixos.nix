{ pkgs, ... }:

{
  users.users.nik = {
    isNormalUser = true;
    home = "/home/nik";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$WuoGBMCjvt$Xz.eIL5wZue/lq2h8t6x2xrLPLagjKumGORJBvEFY9JUzDMO6NX03v7QmSqLxw46TDUxW5W50hQDyOMF89w0K1";
    openssh.authorizedKeys.keys = [
        "SHA256:bhACLYfJv9qf+m90YGSXaPN4C/6PP+iH2exrJqr6ZqQ nik.steffen@pm.me"
        "SHA256:byuYMmuI2jY4aHmdVzaqK/z+hmExv5VdKCh1I0CPbx8 dominik.steffen@bergzeit.de"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/1dd99a6c91b4a6909e66d0ee69b3f31995f38851.tar.gz;
      sha256 = "1z8gx1cqd18s8zgqksjbyinwgcbndg2r6wv59c4qs24rbgcsvny9";
    }))
  ];
}
