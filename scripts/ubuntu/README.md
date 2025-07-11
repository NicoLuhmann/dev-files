# Ubuntu Setup Scripts

This folder contains scripts to automate the setup of a development environment on Ubuntu.

## Usage

Run the main setup script:

```bash
cd SCRIPTS/UBUNTU
bash setup.sh
```

This will:
- Install essential packages and tools (curl, git, tmux, etc.)
- Set up Docker, Ghostty, Starship, Todoist, GNOME, Discord, and Neovim
- Stow dotfiles from `~/dev-files`

**After setup completes:**
- Run `source ~/.bashrc` or open a new terminal to apply environment changes.
