# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository optimized for macOS that uses **GNU Stow** for symlink management. The repository is structured with each tool configuration in its own directory, allowing selective installation of configuration packages.

## Repository Structure

The repository uses a Stow-based architecture where each top-level directory represents a "package" containing dotfiles for a specific tool:

- Each package directory contains files in the same structure as they should appear in `$HOME`
- Running `stow <package>` creates symlinks from `$HOME` to the files in this repository
- Files listed in `.stow-local-ignore` are excluded from stowing (README.md, .git, etc.)

**Key packages:**
- `aerospace/` - Window management config (`.aerospace.toml`)
- `asdf/` - Version manager tooling (`.tool-versions`)
- `elixir/` - IEx REPL configuration (`.iex.exs`)
- `ghostty/` - Terminal emulator config (`.config/ghostty/`)
- `git/` - Git configuration (`.gitconfig`)
- `homebrew/` - Brewfile for dependency management (`.Brewfile`)
- `neovim/` - Neovim editor config (`.config/nvim/`)
- `tmux/` - Terminal multiplexer (`.tmux.conf`)
- `vim/` - Vim editor (`.vimrc`)
- `zsh/` - Zsh shell configuration (`.zshrc`)
- `obsidian-vault-config/` - Not managed by Stow

## Common Commands

### Stow Operations

Install a specific package:
```bash
stow <package-name>  # e.g., stow vim, stow git
```

Install all packages:
```bash
stow */
```

Remove/unlink a package:
```bash
stow -D <package-name>
```

Re-stow (useful after updating configs):
```bash
stow -R <package-name>
```

### Testing Changes

After modifying dotfiles, test the changes:

**Zsh:**
```bash
source ~/.zshrc
```

**Git:**
```bash
git config --list  # Verify configuration loaded correctly
```

**Tmux:**
```bash
tmux source ~/.tmux.conf  # If inside tmux session
```

**Ghostty:**
```bash
# Use alt+s>r to reload config (custom keybind)
```

**Neovim:**
```bash
# LazyVim-based configuration - plugins auto-install on first launch
# Excluded files: lazy-lock.json (generated), README.md, LICENSE
```

## Important Conventions

### File Paths
- **macOS-specific paths:** This setup uses macOS paths like `/opt/homebrew/` (Apple Silicon) for Homebrew
- **XDG Base Directory:** Ghostty config uses XDG path: `.config/ghostty/config`
- **External dependencies:** The zshrc sources `~/aliases.zsh` which is NOT in this repository (lives in $HOME directly)

### Git Configuration Notes
- Git commit template references `/Users/kiran/.gitmessage` (external file)
- Uses `delta` as the pager for better diff viewing
- Default branch is `main`
- Pull strategy: fast-forward only with rebase enabled
- Merge conflict style: `zdiff3`

### Shell Configuration
- **Oh-My-Zsh:** Required dependency, sourced from `$HOME/.oh-my-zsh`
- **Plugins:** git, zsh-autosuggestions, zsh-syntax-highlighting
- **Prompt:** Uses Starship prompt (`starship init zsh`)
- **FZF integration:** Configured with fd as the default command
- **ASDF:** Loaded from `/opt/homebrew/opt/asdf/libexec/asdf.sh`

### AeroSpace Window Manager
- Tiling window manager configuration with workspace assignments
- Uses vim-like keybindings (hjkl) for navigation with alt modifier
- Automatic window assignments for common apps (browser → workspace 1, terminal → workspace 2, etc.)
- Service mode accessible via `alt+shift+;`

### Dependencies
- **Required:** GNU Stow, Oh-My-Zsh, Homebrew, ASDF
- **Tool versions managed by ASDF:** See `asdf/.tool-versions` for Erlang, Elixir, Java, Clojure, Ruby versions

## Making Changes

When modifying dotfiles:

1. Edit files directly in this repository or through the symlinks in `$HOME`
2. Changes are automatically reflected since files are symlinked
3. Commit and push changes:
   ```bash
   git add <modified-files>
   git commit -m "Update configuration"
   git push
   ```

### Adding New Tool Configurations

To add a new tool's dotfiles:

1. Create a new directory: `mkdir <tool-name>`
2. Add the config file(s) in the same path structure as $HOME:
   ```bash
   # Example for a tool with config at ~/.config/tool/config
   mkdir -p <tool-name>/.config/tool
   # Add config file to <tool-name>/.config/tool/config
   ```
3. Stow the new package: `stow <tool-name>`
4. Update README.md's "Available Packages" section

### Handling Conflicts

If stowing fails due to existing files:
1. Backup existing dotfiles: `cp ~/.vimrc ~/.vimrc.backup`
2. Remove the conflicting file: `rm ~/.vimrc`
3. Try stowing again: `stow vim`
