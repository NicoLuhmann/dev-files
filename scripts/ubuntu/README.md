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
- Configure environment variables (e.g., `NVIM_MODE_LUH`)

**After setup completes:**
- Run `source ~/.bashrc` or open a new terminal to apply environment changes.

## Additional Steps

For Node.js and CLI tools (if needed):

```bash
nvm install stable
nvm use stable
npm install -g @mermaid-js/mermaid-cli
npm install -g tree-sitter-cli
```

## PDF/ImageMagick Policy Fix (if working with PDFs)

Check Ghostscript version:

```bash
gs --version
```

If ≥ 9.24, you can safely relax ImageMagick's PDF policy for personal files:

1. Edit `/etc/ImageMagick-6/policy.xml`
2. Locate:
   ```xml
   <policy domain="coder" rights="none" pattern="{PS,PS2,PS3,EPS,PDF,XPS}" />
   ```
3. Either comment it out, or change to:
   ```xml
   <policy domain="coder" rights="read|write" pattern="PDF,PS" />
   ```
