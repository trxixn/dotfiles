# Dotfiles

My personal dotfiles repository containing configuration files for various tools and applications I use in my development workflow. Poured my heart and soul into them and i hope it will become a starting point for your personal config too :).

## Included Configurations

### Neovim (`nvim/`)
- Custom Neovim configuration
- FuzzyFinder, LSP/PATH/PROJECT based autocompletion, (currently commented) AI Inline Completion
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
- Smart pane switching with Vim awareness

### Aerospace (`.aerospace.toml`)
- Basic i3 style window manager for my mac (tried [Yabai](https://github.com/koekeishiya/yabai), didn't enojoy it as much)

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
- (Optional) [Aerospace](https://github.com/nikitabobko/AeroSpace) - i3-like Window Manager only for MacOS

## Customization

Feel free to use these configurations as a starting point for your own setup.


