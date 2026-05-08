# Dotfiles

This repository contains my dotfiles used for my Ubuntu-Setup.
It uses [toml-bombadil](https://github.com/oknozor/toml-bombadil) as a Dotfile-Manager and is heavily based on [this setup](https://github.com/VJMReichenbach/dotFiles) with some modifications.

## Shell Setup

### Prerequisites

Some of those should already be installed, but we need to install **curl**, **cmake**, a **nerd font**, and finally **zsh**:

```bash
sudo apt install curl cmake zsh zoxide g++ pkg-config libfontconfig1-dev libxcb-xfices0-dev libxkbcommon-dev python3 nodejs
```

We then can install **Rust**:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

and then **toml-bombadil**, as well as **Alacritty**, **Zellij**, **Starship**, as well as **tree-sitter-cli** (for Neovim):

```bash
cargo install toml-bombadil alacritty zellij starship tree-sitter-cli
```

To make **Zellij** work, we need to link it into a directory in `PATH` with:

```bash
sudo ln -s ~/.cargo/bin/zellij /usr/local/bin
```

Then, finally set **Alacritty** as your default terminal emulator with
```bash 
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.cargo/bin/alacritty 50
```

### Theme & Configs

First, clone this repository:

```bash
git clone https://github.com/lukasgeis/dotfiles.git ~/dotfiles
```

Install the Nerd-Fonts via 
```bash 
cp -r ~/dotfiles/shell/.fonts/. ~/.fonts/
fc-cache -fv
```

and then use it with:

```bash
bombadil install ~/dotfiles
bombadil link
```

If you make changes, apply these changes with

```bash
bombadil link
```

or the short alias `bbl` (after first link).

## NeoVim Setup

No real setup has to be done.
Only **NeoVim** as well as **ripgrep** (for Telescope) and **python3-venv** (`pylsp`) have to be installed via:


```bash
# Stable NeoVim versions don't work with this setup
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

sudo apt install neovim ripgrep python3-venv 
```

In case, the version of `node` is not high enough, install the required version via
```bash
curl -sL https://deb.nodesource.com/setup_<Version>.x | sudo -E bash -
sudo apt install nodejs
```

After opening Neovim, all plugins should get installed, only `Copilot` needs a manuel setup via `:Copilot signin`

## Further Stuff

I also like to set the following to allow me to scroll much faster
```bash 
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
```

## Credits

The setup was built with the help of/inspired by

- [Kickstart-Nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master)
- [DreamsOfCode](https://github.com/dreamsofcode-io/DreamNvim/tree/main)
- [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&ab_channel=ThePrimeagen)

Also check out the [NerdFont-Website](https://www.nerdfonts.com/).
