# Dotfiles

*Note: This setup is pretty much fine-tuned for OSX.*

Your dotfiles are how you personalize your system. These are mine.

Feel free to fork it and use as per your liking.

## Installation with GNU Stow

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles. Stow creates symlinks from this repository to your home directory, making it easy to keep your dotfiles in version control.

### Prerequisites

Install GNU Stow:

```bash
# On macOS
brew install stow

# On Ubuntu/Debian
sudo apt install stow

# On Arch Linux
sudo pacman -S stow
```

### Usage

1. Clone this repository to your home directory:
   ```bash
   cd ~
   git clone <your-repo-url> dotfiles
   cd dotfiles
   ```

2. Stow individual packages:
   ```bash
   stow vim      # Creates symlink: ~/.vimrc -> ~/dotfiles/vim/.vimrc
   stow git      # Creates symlink: ~/.gitconfig -> ~/dotfiles/git/.gitconfig
   stow zsh      # Creates symlink: ~/.zshrc -> ~/dotfiles/zsh/.zshrc
   stow tmux     # Creates symlink: ~/.tmux.conf -> ~/dotfiles/tmux/.tmux.conf
   ```

3. Or stow everything at once:
   ```bash
   stow */
   ```

### Available Packages

- **aerospace** - Window management (`.aerospace.toml`)
- **asdf** - Version manager (`.tool-versions`)
- **elixir** - Elixir/IEx configuration (`.iex.exs`)
- **ghostty** - Terminal emulator (`Library/Application Support/com.mitchellh.ghostty/`)
- **git** - Git configuration (`.gitconfig`)
- **homebrew** - Homebrew bundle (`.Brewfile`)
- **tmux** - Terminal multiplexer (`.tmux.conf`)
- **vim** - Vim editor (`.vimrc`)
- **zsh** - Zsh shell (`.zshrc`)

### Managing Changes

After making changes to your dotfiles:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
```

Since the files in your home directory are symlinked to this repository, any changes you make to them will be automatically reflected here.

### Removing Packages

To unlink a package:

```bash
stow -D vim  # Removes the ~/.vimrc symlink
```

### Notes

- **obsidian-vault-config** - Contains Obsidian vault settings and is not managed by Stow
- Stow automatically ignores `.git`, `README.md`, and similar files
- If you have existing dotfiles, back them up before stowing to avoid conflicts
