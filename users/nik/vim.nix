self: super:

let sources = import ../../nix/sources.nix; in rec {
  # My vim config
  customVim = with self; {
    vim-fish = vimUtils.buildVimPlugin {
      name = "vim-fish";
      src = sources.vim-fish;
    };

    vim-fugitive = vimUtils.buildVimPlugin {
      name = "vim-fugitive";
      src = sources.vim-fugitive;
    };

    vim-config = vimUtils.buildVimPlugin {
      name = "vim-config";
      src = sources.vim-config;
    };

    dracula = vimUtils.buildVimPlugin {
      name = "dracula";
      src = sources.vim-dracula;
    };

    AfterColors = vimUtils.buildVimPlugin {
      name = "AfterColors";
      src = pkgs.fetchFromGitHub {
        owner = "vim-scripts";
        repo = "AfterColors.vim";
        rev = "9936c26afbc35e6f92275e3f314a735b54ba1aaf";
        sha256 = "0j76g83zlxyikc41gn1gaj7pszr37m7xzl8i9wkfk6ylhcmjp2xi";
      };
    };

    vim-nerdtree = vimUtils.buildVimPlugin {
      name = "nerdtree";
      src = fetchFromGitHub {
        owner = "preservim";
        repo = "nerdtree";
        rev = "eed488b1cd1867bd25f19f90e10440c5cc7d6424";
        sha256 = "0hlyn2l9ppjn92zaiw51i6d15li15z5083m13m0710giqx05qrak";
      };
    };
  };
}
