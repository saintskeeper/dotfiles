# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that contains Bash shell configurations and utilities. The repository provides a streamlined way to bootstrap and manage shell environments across different systems.

## Architecture

The repository follows a simple structure with shell configuration files at the root and utility scripts in subdirectories:

- **Shell configuration files**: `.aliases`, `.functions`, `.bash_profile`, `.bashrc`, `.bash_prompt`, `.profile`
- **Bootstrap scripts**: `scripts/bootstrap.sh` for moving dotfiles to home directory
- **Configuration scripts**: `configure.sh` for symlink-based setup
- **Starship prompt**: Custom prompt configuration in `starship/starship.toml`

## Key Commands

### Installation

To install the dotfiles:
```bash
source scripts/bootstrap.sh
move_dotfiles
```

This will copy all dotfiles to the home directory, including the `.config` directory.

### Starship Setup (Ubuntu)

1. Install Starship:
```bash
# Install via snap (recommended for Ubuntu)
sudo snap install starship

# Or install via shell script
curl -sS https://starship.rs/install.sh | sh
```

2. Copy the Starship configuration:
```bash
mkdir -p ~/.config
cp starship/starship.toml ~/.config/starship.toml
```

3. Add Starship to your shell:
```bash
# Add this line to your .bashrc or .bash_profile
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc
```

### Alternative Setup (Symlinks)

The `configure.sh` script provides a symlink-based setup (requires `files-to-link.txt`).

## Important Files

### .aliases
Contains command shortcuts for:
- Navigation (cd aliases)
- Kubernetes/kubectl operations (k, kg, kd, etc.)
- Flux CD operations (f, fgh, fgk, etc.)
- Git operations
- Development tools (ansible, vim/nvim)

### .functions
Contains utility functions for:
- Kubernetes operations (`rapid-kube-apply`, `rmns`, `drain-node`)
- Git utilities (`gb`, `gp`, `gcm`, `git-branches-delete`)
- Docker/container operations (`linux-run`, `kaniko-build`)
- Consul/Vault operations
- Terraform utilities (`tf-local-test`)
- AWS ECR import functions
- Tekton pipeline operations

### starship/starship.toml
Configures the Starship prompt with:
- Solarized color scheme
- Kubernetes context/namespace display
- AWS profile/region display
- Git branch and status
- Directory truncation

## Platform-Specific Notes

The `configure.sh` script includes macOS-specific PATH configuration for Homebrew at `/opt/homebrew/bin`.