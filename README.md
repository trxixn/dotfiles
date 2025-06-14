# Dotfiles

My personal dotfiles repository containing configuration files for various tools and applications I use in my development workflow.

## Included Configurations

### Neovim (`nvim/`)
- Custom Neovim configuration with LSP support
- Optimized for modern development workflows
- Includes key mappings and plugin configurations
- Language server support for various programming languages

### Kitty (`kitty/`)
- Modern, GPU-accelerated terminal emulator
- Custom color schemes and font settings
- Optimized for performance and readability
- Integration with other tools in the workflow

### Tmux (`.tmux.conf`)
- Custom key bindings with `C-a` as prefix (instead of default `C-b`)
- Vim-style pane navigation (h,j,k,l)
- Mouse support enabled
- Smart pane switching with Vim awareness
- Transparent background integration with Kitty
- Quick window switching with Space key
- Optimized for 256-color terminals

### Firefox (`userChrome.css`)
- Custom Firefox styling made for using [Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)
- Currently switched to [Zen Browser](https://zen-browser.app/) 

## Installation

Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## Dependencies

### Core Tools
- [Neovim](https://neovim.io/) - Modern Vim-based text editor
- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal emulator
- [Tmux](https://github.com/tmux/tmux/wiki) - Terminal multiplexer
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Fast text search tool (required for Neovim's fuzzy finder)

## Customization

Feel free to use these configurations as a starting point for your own setup.


