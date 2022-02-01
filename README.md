# Dotfiles
Concept and most of the execution lovingly stolen from [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles). Organized in the following manner:

## Tracked packages
- Neovim
- Tmux
- ZSH

## Management
The dotfiles are managed as symlinks using [`stow`](https://www.gnu.org/software/stow/). In order to install these dotfiles on a machine, one must:
1. Install Homebrew if on a Mac
2. Install Stow via the package manager of choice
3. Clone this repo into the home directory of the target machine
4. Run the included install script
