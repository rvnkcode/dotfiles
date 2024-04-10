# Raspberry Pi 5

## SSH

Add some public key to the `~/.ssh/authorized_keys` if needed.

## Utils

```zsh
sudo apt update
sudo apt upgrade
sudo apt install git gh zsh ranger
```

## dotfiles

[Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

After clone the repository,

```zsh
echo 'alias dfs="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
zsh
rm -rf .zshrc
dfs checkout rpi
```

## Font

```zsh
wget https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v1.0.5-0/sarasa-fixed-k-nerd-font.zip
wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip
```

After unzip,

```zsh
# create directory if needed
mkdir -p ~/.local/share/fonts/font_name
mv *.ttf ~/.local/share/fonts/font_name
sudo fc-cache -f -v
fc-list | grep "D2"
fc-list | grep "sarasa"
```

- [Sarasa-Gothic-Nerd-Fonts](https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/tag/v1.0.5-0)
  - [Sarasa Gothic Mono](https://picaq.github.io/sarasa/)
- [D2Coding Ver 1.3.2](https://github.com/naver/d2codingfont/releases/tag/VER1.3.2)
- [네이버 나눔 글꼴](https://hangeul.naver.com/font/nanum)

## Zsh

```zsh
mkdir .zsh && cd .zsh
chsh -s $(which zsh) # set zsh as default shell
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth 1 -- https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
zsh # Restart zsh shell
p10k configure # if needed
```

## asdf

[Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)

Install nodejs.

```zsh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
npm doctor
npm install -g npm@latest
```

## Neovim

[Neovim/Build.md](https://github.com/neovim/neovim/blob/master/BUILD.md)

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

- [x] Install linter `:Mason`
  - [x] sqlfluff
  - [x] markdownlint
- [x] Install formatter `:Mason`
  - [x] stylua
  - [x] prettier
  - [x] google_java_format
- [ ] Deal with lemminx

## GitHub Auth and git

```zsh
# set GH pat env variable
GH_PAT="PAT value"
gh auth login --with-token <<< $GH_PAT
gh ssh-key add ~/.ssh/id_ed25519.pub --title "RPi5"
# Use SSH instead of the HTTPS
git remote set-url origin git@github.com:ssh/url.git
```

### Set and unset env variables

```zsh
ENV_VAR="value"
unset ENV_VAR
```

## Desktop

```zsh
sudo apt install sway wofi xwayland swaylock swayidle
sudo apt install firefox
sudo apt install fcitx5 fcitx5-hangul fcitx5-mozc
```

## APT History

`/var/log/apt/history.log`
