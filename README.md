# Dotfiles

This repository contains my dotfiles used for my EndeavorOS setup.
It uses [toml-bombadil](https://github.com/oknozor/toml-bombadil) as a Dotfile-Manager and is heavily based on [this setup](https://github.com/EldosHD/dotFiles) with some modifications.

## Important Remarks

Make sure to change **name** and **email** to your own in special files such as `.gitconfig`.


## Shell Setup

I use EndeavorOS which is an Arch-based Linux distribution so all following steps are meant to be used on Arch.
Most commands however can easily be translated to work with other Linux distributions.

### Prerequisites

Some of those should already be installed, but we need to install **curl**, **cmake**, a **nerd font**, and finally **zsh** as well as **zoxide**:
```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji zsh zoxide
```

We then can install **Rust**:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
and then **toml-bombadil**, as well as **Alacritty**, **Zellij**, **Starship**:
```bash
cargo install toml-bombadil alacritty zellij starship
```

Note that installations with **cargo** can be spedup by first installing **cargo-binstall**
```bash
cargo install cargo-binstall
```
and then using `cargo binstall` instead of `cargo install`.

To make **Zellij** work, we need to link it into a directory in `PATH` with:
```bash
sudo ln -s ~/.cargo/bin/zellij /usr/local/bin
```

Then, finally set **Alacritty** as your default terminal emulator.

### Theme & Configs

First, clone this repository:
```bash
git clone https://github.com/lukasgeis/dotfiles.git ~/dotfiles
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
or the short alias `bbl`.


## NeoVim Setup

No real setup has to be done.
Only NeoVim has to be installed via:
```bash
sudo pacman -S --noconfirm neovim 
```

The setup was built with the help of/inspired by
* [Kickstart-Nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master)
* [DreamsOfCode](https://github.com/dreamsofcode-io/DreamNvim/tree/main)
* [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&ab_channel=ThePrimeagen)
