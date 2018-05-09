# =============================================
# zsh preferences
# =============================================

# 文字コードをUTF-8
export LANG=ja_JP.UTF-8

# 日本語ファイルを表示可能にする
setopt print_eight_bit

# ビープ音を停止
setopt no_beep

# ビープ音を停止(補完時)
setopt nolistbeep

# cd-tab でディレクトリの移動履歴を表示
setopt auto_pushd

# コマンド履歴の保存と保存履歴数
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHEST=1000

# 同時起動のzsh間でコマンド履歴を同期させる
setopt share_history

# 直前と同じコマンドの繰り返しは履歴に含めない
setopt hist_ignore_dups

# 重複するコマンドは履歴に加えない
setopt hist_ignore_all_dups

# スペースから始まるコマンドは履歴に含めない
setopt hist_ignore_space

# 履歴に保存する際に余分なスペースは削除する
setopt hist_reduce_blanks

# キーバインドをVimに似せる
bindkey -v

# =============================================
# alias
# =============================================

# ------------------------------
# Login
# ------------------------------
echo '====================\nHello!\n====================' ; date ; cal
alias x='echo "====================\nSee you!\n====================" ; exit'

# ------------------------------
# Command
# ------------------------------
alias c='clear'
alias cat='cat -n'
alias chi='clear; history -c'
alias cp='cp -iv'
alias ls='gls -AF --color=auto'
alias mv='mv -iv'
alias rm='rm -iv'
# alias vim='/usr/local/bin/vim'

# ------------------------------
# Open command
# ------------------------------
alias o='open'
alias oa='open -a'
alias oai='oa Adobe\ Illustrator &'
alias och='oa Google\ chrome &'
alias oda='oa Dashlane &'
alias oev='oa Evernote &'
alias oit='oa iTunes &'
alias omg='oa Magnet &'
alias osa='oa Safari &'


# ------------------------------
# Ruby
# ------------------------------
alias post='ruby ~/ruby/tweet.rb'
alias tweet='vim ~/ruby/tweet.rb'
alias tline='ruby ~/ruby/time_line.rb'

# ------------------------------
# Advanced setting
# ------------------------------
# fgの代わりにCtrl-Zで中断したプログラムを再開する
# cf. http://postd.cc/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
