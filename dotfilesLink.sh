#!/bin/bash
function makeSymLink() {
  if [ ! -e $1 ]; then return; fi # リンク元のファイルがない
  if [ -e $2 ]; then return; fi # シムリンクを作ろうとしているところにすでにファイルあり

  ln -s $1 $2
  echo "Create $1 to $2 symbolic link."
}

makeSymLink $(pwd)/alacritty  ~/.config/alacritty
makeSymLink $(pwd)/tmux/.tmux.conf  ~/.tmux.conf
makeSymLink $(pwd)/lazygit  ~/.config/lazygit
makeSymLink $(pwd)/zsh/.zshrc ~/.zshrc
makeSymLink $(pwd)/zsh/.p10k.zsh ~/.p10k.zsh
makeSymLink $(pwd)/ssh         ~/.ssh
makeSymLink $(pwd)/.gitconfig  ~/.gitconfig
makeSymLink $(pwd)/.gitignore_global ~/.gitignore_global
makeSymLink $(pwd)/nvim  ~/.config/nvim
makeSymLink $(pwd)/tig/.tigrc ~/.tigrc
makeSymLink $(pwd)/yazi ~/.config/yazi
