#!/bin/bash
function makeSymLink() {
  if [ ! -e $1 ]; then return; fi # リンク元のファイルがない
  if [ -e $2 ]; then return; fi # シムリンクを作ろうとしているところにすでにファイルあり

  ln -s $1 $2
  echo "Create $1 to $2 symbolic link."
}

function makeClaudeSymLink() {
  if [ ! -e $1 ]; then return; fi # リンク元のファイルがない
  
  # .claudeディレクトリが存在しない場合は通常通りシンボリックリンクを作成
  if [ ! -e $2 ]; then
    ln -s $1 $2
    echo "Create $1 to $2 symbolic link."
    return
  fi
  
  # .claudeディレクトリが存在するが、settings.jsonがない場合のみシンボリックリンクを作成
  if [ -d $2 ] && [ ! -e $2/settings.json ]; then
    rm -rf $2
    ln -s $1 $2
    echo "Create $1 to $2 symbolic link."
  fi
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
makeClaudeSymLink $(pwd)/claude  ~/.claude
