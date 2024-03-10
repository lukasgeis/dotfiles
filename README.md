# Dotfiles

This repository contains my dotfiles used for my EndeavorOS setup.
It uses [toml-bombadil](https://github.com/oknozor/toml-bombadil) as a Dotfile-Manager and is heavily based on [this setup](https_//github.com/EldosHD/dotFiles) with some modifications.

## Installation

I use EndeavorOS which is an Arch-based Linux distribution so all following steps are meant to be used on Arch.
Most commands however can easily be translated to work with other Linux distributions.

### Prerequisites

Some of those should already be installed, but we need to install **curl**, **cmake**, a **nerd font**, and finally **zsh**:
```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji zsh
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

## Setup

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
