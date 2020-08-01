# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# turn off suspend and resume feature
stty -ixon

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
  git
  colored-man-pages
  zsh-autosuggestions
  zsh-completions
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Dir: current working directory
#prompt_dir() {
  #prompt_segment blue black '%2~'
#}

# Dir version 2
#prompt_dir() {
  #prompt_segment blue black "%$(( $COLUMNS - 53 ))<...<%~%<<"
#}

# Dir version 3
prompt_dir() {
  prompt_segment blue black "%-53<...<%~%<<"
}

#HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
#HISTTIMEFORMAT="%a-%b-%d-%y %T %j %Z"
SAVEHIST=1000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

################
#     ALIAS
################
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# i.e. google how to cook
alias google='f(){xdg-open "https://google.com/search?q=$*";unset -f f;};f'

# check my IP
alias my-ip='$( dig +short myip.opendns.com @resolver1.opendns.com )'
################
#   END ALIAS
################

# Elixir - enable shell history
export ERL_AFLAGS="-kernel shell_history enabled"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# node version manager (nvm)
export NVM_DIR="$HOME/.nvm"
export NVM_NODEJS_ORG_MIRROR="http://nodejs.org/dist/"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PATH=~/.local/bin:$PATH

# !!IMPORTANT!!
# Note: the 'source' command below MUST BE at the end of this file!!
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

