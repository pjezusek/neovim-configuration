# Neovim configuration

Configuration for [neovim](https://neovim.io/).

## Table of contents

1. [Dependencies](#dependencies)
    1. [System](#system)
    1. [Linters and language servers](#linters-and-language-servers)
    1. [Fonts](#fonts)
2. [Screenshots](#screenshots)
3. [Note](#note)

## Dependencies

List of programs/fonts/languages which should be installed to use all the features of the configuration.

### System
- fd
  - More info: [Repository](https://github.com/sharkdp/fd)
  - Install [Archlinux]: `pacman -S fd`
- ripgrep
  - More info: [Repository](https://github.com/BurntSushi/ripgrep)
  - Install [Archlinux]: `pacman -S ripgrep`
- ag
  - More info: [Repository](https://github.com/ggreer/the_silver_searcher)
  - Install [Archlinux]: `pacman -S the_silver_searcher`

### Linters and language servers

- lua-language-server
  - More info: [Repository](https://github.com/sumneko/lua-language-server)
  - Install [Archlinux]: `pacman -S lua-language-server`
- Ruby language server
  - More info: [Repository](https://github.com/castwide/solargraph)
  - Install: `gem install solargraph`
- Treesitter
  - `:TSInstall lua`
  - `:TSInstall ruby`

### Fonts
The font which I use is [FiraCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).
To install it visit [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#font-installation), clone the repository and
use `install.sh` to install the desired font.
After that, change the font in your terminal.
For example ([kitty terminal](https://github.com/kovidgoyal/kitty)):
```
# ~/.config/kitty/kitty.conf

font_family Fira Code Regular Nerd Font Complete
bold_font auto
italic_font auto
bold_italic_font auto
font_size 12
```

### Usage

Open neovim and type `PackerSync`.

# Screenshots
Soon...

To see configuration for bash, fish, terminal or i3 which I use, visit [Click](https://github.com/pjezusek/dotfiles-archlinux).

# Note
Feel free to ask about details of the configuration. I will answer asap.
