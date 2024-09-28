# Dotfiles

This repository contains my dotfiles used for my EndeavorOS setup.
It uses [toml-bombadil](https://github.com/oknozor/toml-bombadil) as a Dotfile-Manager and is heavily based on [this setup](https://github.com/VJMReichenbach/dotFiles) with some modifications.

## Important Remarks

Make sure to change **name** and **email** to your own in special files such as `.gitconfig`.

## Shell Setup

I use EndeavorOS which is an Arch-based Linux distribution so all following steps are meant to be used on Arch.
Most commands however can easily be translated to work with other Linux distributions.

### Prerequisites

Some of those should already be installed, but we need to install **curl**, **cmake**, a **nerd font**, and finally **zsh**:

```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji zsh zoxide
```

We then can install **Rust**:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

and then **toml-bombadil**, as well as **Alacritty**, **Zellij**, **Starship**, as well as **zoxide**:

```bash
cargo install toml-bombadil alacritty zellij starship zoxide
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
Only **NeoVim** as well as **ripgrep** (for Telescope) has to be installed via:

```bash
sudo pacman -S --noconfirm neovim ripgrep
```

The setup was built with the help of/inspired by

- [Kickstart-Nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master)
- [DreamsOfCode](https://github.com/dreamsofcode-io/DreamNvim/tree/main)
- [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&ab_channel=ThePrimeagen)

## Setup on Ubuntu

Most steps are identical to the above steps (with replacing `pacman` with `apt`).
The following differ:

- The **Nerd-Font** can not be installed via one command but instead must be installed manually as described [here](https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0)
- Dependencies for **Alacritty** need to be installed as mentioned [here](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#dependencies)
- To set **Alacritty** as your default terminal follow the steps [here](https://askubuntu.com/questions/1364954/make-alacritty-the-default-terminal-permanently)
- Installing **NeoVim** via `apt` only yields version `0.6.x` but we need at least `0.7.0` to make our config work. Thus install via source or from the `ppa:neovim-ppa/unstable` channel
