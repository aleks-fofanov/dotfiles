# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rockwell/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(
  git
  docker
  docker-compose
  kops
  kubectl
  minikube
  terraform
  helm
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Completions

source <(aws-vault --completion-script-zsh)
source <(fluxctl completion zsh)
source <(flux completion zsh)
complete -C '/usr/local/bin/aws_completer' aws


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rockwell/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rockwell/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rockwell/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rockwell/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Other user-specific environment variables

export EDITOR=/bin/nano
export KUBECONFIG=~/.kube/config:~/.kube/microk8s
export GOROOT=/usr/local/go
export PATH=/home/rockwell/go/bin:$GOROOT/bin:/home/rockwell/.linkerd2/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export AWS_ASSUME_ROLE_TTL=1h
export AWS_SESSION_TTL=1h
export AWS_FEDERATION_TOKEN_TTL=1h
export CHAMBER_KMS_KEY_ALIAS=aws/ssm
export FLUX_FORWARD_NAMESPACE=fluxcd
export DOCKER_BUILDKIT=1

export SPEEDCTL_HOME=/home/rockwell/.speedscale
export PATH=$SPEEDCTL_HOME:$PATH

# Nordic colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tmux='TERM=xterm-256color tmux'
alias winbox='wine /usr/local/bin/winbox64.exe'
alias kc='kubectl'
alias btest='wine /usr/local/bin/btest.exe'
alias gitsquash_dev='git reset $(git merge-base dev $(git rev-parse --abbrev-ref HEAD))'
alias gitsquash_master='git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))'
alias laws='aws --endpoint-url=http://localhost:4566 --profile=localstack'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias mkctl="microk8s kubectl"
alias ls='exa'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable completion
autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit

# Enable direnv
eval "$(direnv hook $SHELL)"

# Enable tfswitch
load-tfswitch() {
  local tfswitchrc_path=".tfswitchrc"
  local terragrunt_path="terragrunt.hcl"

  if [ -f "$tfswitchrc_path" ] || [ -f "$terragrunt_path" ]; then
    tfswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch
