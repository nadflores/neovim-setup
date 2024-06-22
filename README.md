# Neovim setup for macOS

This project is a personal config for neovim.

## Setup

1. Clone this to `/.config`.
2. Install Homebrew https://brew.sh/

## Install Neovim

`brew install neovim`

## Install Plugin Dependencies

1. `brew install fzf` - This will install fuzzy finder. Required by fzf search
2. `brew install ripgrep` - This is required by telescope live grep
3. Download nerd font in https://www.nerdfonts.com/font-downloads.
   Look for `Hack Nerd Font`. Install it via `Font book`. This is needed for the icons in neotree etc.

## Run

Run `nvim`. This will automatically install all plugins via Lazy.

## Colorscheme

Update file `~/config/.nvim/lua/nadflores/plugins/colorscheme`
