# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Default: ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# DEFAULT_USER=$USER
# prompt_context() {}
# This is overridden by the Pure settings below.
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos xcode docker fzf golang ripgrep zoxide pass)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# PATH extensions
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/Users/renangreca/.local/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias diff='/opt/homebrew/Cellar/diffutils/3.10/bin/diff'
# Aliases for ls alternative eza
# List files showing nerdfont icons and git status
alias ls="eza --icons --git"
# Display file details in a table, from newest to oldest
alias ll="ls -l --sort oldest"
# Also display hidden files
alias la="ls -la --sort oldest"
# Display file with sizes, from largest to smallest
alias lr="ls -la --reverse --sort size"
alias tree="ls --tree"

alias venv="source env/bin/activate"

# Aliases for cat alternative bat
alias cat="bat"
export BAT_THEME="Sublime Snazzy"

# Aliases for ripgrep
alias grep="rg"

# Aliases for fzf
alias fzf="fzf --preview 'bat --color=always {}'"
# alias find="fzf"
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh
source ~/.config/fzf-git.sh/fzf-git.sh
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

_fzf_complete_pass() {
  _fzf_complete -- "$@" < <(
    PASS_PATH=$(echo ~/.password-store)
    PWD_FILES=$(find $PASS_PATH -type f -name "*.gpg" | sed -e "s:$PASS_PATH/::" | sed -e "s:\.gpg::")
    echo $PWD_FILES  
  )
}

_fzf_comprun() {
  local command=$1
  shift
  
  case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    # pass) find ~/.password-store -type f -name "*.gpg" -printf "%P\n" | fzf --preview 'pass {}' "$@" ;;
    pass) fzf --preview 'pass {}' "$@" ;;
    *) fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}


# Aliases for z
eval "$(zoxide init zsh)"
alias cd="z"
alias zz="z -"

# API Keys
# Retrieved from https://www.notion.so/my-integrations/
export NOTION_TOKEN=$(cat ~/.NOTION_TOKEN)
# Retrieved from https://developer.todoist.com/appconsole.html
export TODOIST_TOKEN=$(cat ~/.TODOIST_TOKEN)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# Additional ZSH plugins installed with brew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Customize directory display for Agnoster theme
prompt_dir() {
  prompt_segment green $CURRENT_FG '%c'
}

# Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
# zstyle ':prompt:pure:prompt:*'
PURE_PROMPT_SYMBOL=' ❯'
prompt pure

# thefuck
eval $(thefuck --alias)
eval "$(mise activate zsh)"
