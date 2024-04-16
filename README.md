# Raspberry Pi 5

## SSH

Add some public keys to the `~/.ssh/authorized_keys` if needed.

## Utils

```zsh
sudo apt update
sudo apt upgrade
sudo apt install git gh zsh ranger
```

## Font

```zsh
wget https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v1.0.10-0/sarasa-fixed-k-nerd-font.zip
wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip
```

After unzip,

```zsh
mkdir -p ~/.local/share/fonts/D2_Coding
mkdir -p ~/.local/share/fonts/sarasa-fixed-k-nerd-font
mv *.ttf ~/.local/share/fonts/font_name
sudo fc-cache -f -v
# Check font installation
fc-list | grep "D2"
fc-list | grep "sarasa"
```

- [Sarasa-Gothic-Nerd-Fonts](https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases)
  - [Sarasa Gothic Mono](https://picaq.github.io/sarasa/)
- [D2Coding Ver 1.3.2](https://github.com/naver/d2codingfont/releases/tag/VER1.3.2)
- [네이버 나눔 글꼴](https://hangeul.naver.com/font/nanum): download manually

## Zsh

```zsh
mkdir .zsh && cd .zsh
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth 1 -- https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
```

## Desktop

```zsh
sudo apt install sway wofi xwayland swaylock swayidle
sudo apt install firefox
sudo apt install fcitx5 fcitx5-hangul fcitx5-mozc
```

## GitHub Auth and git

```zsh
ssh-keygen -t ed25519
# Set GH PAT to temp env variable
GH_PAT="PAT value"
gh auth login --with-token <<< $GH_PAT
gh ssh-key add ~/.ssh/id_ed25519.pub --title "RPi5"
# Use SSH instead of HTTPS
git remote set-url origin git@github.com:ssh/url.git
```

### How to unset env variables

```zsh
unset ENV_VAR
```

## [asdf](https://asdf-vm.com/guide/getting-started.html)

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

## dotfiles

[Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

```zsh
echo 'alias dfs="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
zsh
rm -rf .zshrc
git clone --bare git@github.com:rvnkcode/dotfiles.git $HOME/.dotfiles.git
dfs checkout rpi
dfs config --local status.showUntrackedFiles no
chsh -s $(which zsh) # set zsh as default shell
zsh # Restart zsh shell
p10k configure # if needed
```

## Install [asdf plugins](https://github.com/asdf-vm/asdf-plugins)

After installed some packages, should run `asdf reshim`

### [Nodejs](https://github.com/asdf-vm/asdf-nodejs)

```zsh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
npm doctor
npm install -g npm@latest
```

### [Bun](https://github.com/cometkim/asdf-bun)

```zsh
asdf plugin add Bun
asdf install bun latest
```

### [Rust](https://github.com/code-lever/asdf-rust)

```zsh
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust latest
```

#### [Typos](https://github.com/crate-ci/typos)

```zsh
cargo install typos-cli
```

## [Neovim](https://github.com/neovim/neovim/blob/master/BUILD.md)

```zsh
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
npm install -g neovim
sudo apt install ripgrep wl-clipboard
```

## APT History

`/var/log/apt/history.log`
