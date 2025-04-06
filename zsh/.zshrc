# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#####################################################################
# options
#####################################################################
setopt auto_cd  #cdを使わずにディレクトリを移動できる
setopt correct # スペルチェック。間違うと訂正してくれる
setopt auto_pushd # "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt pushd_ignore_dups # 同じディレクトリを pushd しない
setopt auto_list # 補完候補を一覧で表示する
setopt auto_menu # 補完キー連打で候補順に自動で補完する
# ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
# history
setopt share_history        # ヒストリの共有の有効化
setopt hist_ignore_dups     # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups # ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_reduce_blanks   #コマンド中の余分なスペースは削除して履歴に記録する
setopt inc_append_history   #  履歴をすぐに追加する（通常はシェル終了時）
setopt prompt_subst # git情報表示用
setopt HIST_IGNORE_ALL_DUPS #たぶんzcompdumpを出力させないようにする

#####################################################################
# autoload
######################################################################
autoload -Uz add-zsh-hook   # フック機能を有効にする
autoload -Uz compinit && compinit -u # コマンドのオプションや引数を補完する
autoload -Uz url-quote-magic # URLをエスケープする
autoload -Uz vcs_info # VCS情報の表示を有効にする

#####################################################################
# alias
######################################################################
alias vim='nvim'
alias vi='nvim'
alias ripg='command rg --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"' # rgがrails generateとかぶるため
alias cat='bat'
alias ping='prettyping --nolegend'
alias top="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

#####################################################################
# 環境変数
#####################################################################
export EDITOR=nvim

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# ls 時の色を設定する
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# m1 mac以降 homebrewのインストール先が変わった
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)
# goのライブラリにパスを通す
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
# bunを使えるようにする
export PATH="$HOME/.bun/bin:$PATH"

# rustのライブラリにパスを通す
export PATH="$HOME/.cargo/bin:$PATH"

# 1passwodでsshの管理をできるようにする
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# .config
export XDG_CONFIG_HOME="$HOME/.config"
# direnv(ディレクトリ毎に環境変数を設定できる)
eval "$(direnv hook zsh)"
eval "$(nodenv init -)"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
# zコマンドを使えるように
eval "$(zoxide init zsh)"

eval "$(rbenv init -)"
#####################################################################
# fzf設定
#####################################################################
# Setup fzf
# 1. fzfをインストール
# 2. ripgをインストール
# 3. $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# 4. $ ~/.fzf/install
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
# ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
# ripgrepを使って検索する
export FZF_DEFAULT_COMMAND='command rg --files --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"'
export FZF_DEFAULT_OPTS="--height 40% --reverse --border --inline-info --ansi"
# ctrl-tのときのデフォルトコマンド設定
export FZF_CTRL_T_COMMAND='command rg --files --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"'

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fgb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#####################################################################
# Zinit  (プラグイン管理)
#####################################################################
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#####################################################################
# Zinitのプラグインたち
#####################################################################
zinit light zsh-users/zsh-autosuggestions # 補完
zinit load zdharma/fast-syntax-highlighting # シンタックスハイライト
zinit light zsh-users/zsh-completions # tabでコマンド補完

################
# Oh-my-zshのプラグインたち
################
# https://github.com/ohmyzsh/ohmyzsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::common-aliases
zinit snippet OMZP::rails
zinit snippet OMZP::rbenv
# zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose

# tmuxを起動したらすぐ使えるようにする
# zinit ice atinit"
#         ZSH_TMUX_FIXTERM=true;
#         ZSH_TMUX_AUTOSTART=true;
#         ZSH_TMUX_AUTOCONNECT=true;"
# https://sunday-morning.app/posts/2019-08-31-tmux-ctrl-a
bindkey -e # tmuxでctrl-aとctrl-eが使えない問題の対応
# zinit snippet OMZP::tmux

# startship
# https://starship.rs/ja-JP/
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# bun completions
[ -s "/Users/itoukazuhiro/.bun/_bun" ] && source "/Users/itoukazuhiro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "/Users/itoukazuhiro/.ghcup/env" ] && . "/Users/itoukazuhiro/.ghcup/env" # ghcup-env
# Added by Windsurf
export PATH="/Users/itoukazuhiro/.codeium/windsurf/bin:$PATH"

#####################################################################
# fzf設定
#####################################################################
__fzf_history_widget() {
  BUFFER=$(history 1 | fzf --tac --height 40% --reverse | sed 's/ *[0-9]* *//')
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N __fzf_history_widget
bindkey '^R' __fzf_history_widget
