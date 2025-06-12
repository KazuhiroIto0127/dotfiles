# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environment setup. The repository manages configuration files for various tools and provides automated setup scripts.

## Common Commands

### Initial Setup
```bash
# Full system setup (installs Xcode tools, Homebrew, apps, and creates symlinks)
./setup.sh

# Create symlinks only (without installing software)
./dotfilesLink.sh

# Install/update Homebrew packages
brew bundle --file ./.Brewfile
```

### Development Tools
- **Neovim**: Configured with LazyVim framework using Lazy.nvim plugin manager
- **Terminal**: Multiple terminal emulators supported (Alacritty, WezTerm, iTerm2)
- **Git**: Enhanced with lazygit, gitui, and custom git configuration
- **Shell**: Zsh with custom configuration

## Architecture

### Configuration Structure
- **Terminal configs**: `alacritty/`, `wezterm/` - Terminal emulator configurations
- **Editor configs**: `nvim/` (current LazyVim setup), `nvim.back/` (legacy Packer setup)  
- **Shell configs**: `zsh/` - Zsh configuration files
- **Git configs**: `lazygit/`, `.gitconfig`, `.gitignore_global`
- **Other tools**: `tmux/`, `tig/`, `yazi/` - Various CLI tool configurations

### Neovim Setup
The current Neovim configuration uses LazyVim:
- Entry point: `nvim/init.lua` 
- Plugin manager: Lazy.nvim configured in `nvim/lua/config/lazy.lua`
- Custom plugins: `nvim/lua/plugins/`
- LazyVim integration with custom overrides

### Symlink Management
The `dotfilesLink.sh` script creates symlinks from this repository to standard config locations:
- `~/.config/nvim` → `nvim/`
- `~/.config/alacritty` → `alacritty/`
- `~/.zshrc` → `zsh/.zshrc`
- And other standard XDG/home directory locations

### Package Management
- **Homebrew**: `.Brewfile` manages CLI tools and GUI applications
- **Node.js**: Uses nodenv for version management
- **Development tools**: Includes modern CLI replacements (bat, fd, ripgrep, etc.)