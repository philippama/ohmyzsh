# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Philippa.Main/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="minimal"
#ZSH_THEME=af-magic
ZSH_THEME=philippa
echo oh my zh theme: $ZSH_THEME


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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

# My changes =======================================================================

# Use pyenv instead
#export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

# JAVA SETUP FUNCTIONS - use jenv instead
# function jdk {
#     if [ -n "$1" ] && [ "$1" -gt "8" ]; then
#         export JAVA_HOME=`/usr/libexec/java_home -v $1`
#     else
#         export JAVA_HOME=`/usr/libexec/java_home -v 1.$1`
#     fi
#     PATH=$PATH:$JAVA_HOME/bin
#     echo "Using Java $1 $JAVA_HOME"
# }
#
# jdk 11

# For investigating Kubernetes pods, helm etc.
alias k='kubectl'
alias kprod='gcloud container clusters get-credentials delivery-platform --zone europe-west4-a --project at-delivery-platform-prod && echo Find namespace with \`kubectl get namespace\` then set context with \`kubectl config set-context --current --namespace=namespace\`'
alias kpreprod='gcloud container clusters get-credentials delivery-platform --zone europe-west4-a --project at-delivery-platform-preprod && echo Find namespace with \`kubectl get namespace\` then set context with \`kubectl config set-context --current --namespace=namespace\`'
export PATH="$PATH:/Users/Philippa.Main/istio-1.15.0/bin"

# pyenv and jenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Google Cloud SDK PATH and gcloud command completion
if [ -f '/Users/Philippa.Main/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Philippa.Main/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/Philippa.Main/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Philippa.Main/google-cloud-sdk/completion.zsh.inc'; fi

# Load Git completion
#zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
#fpath=(~/.zsh $fpath)
#autoload -Uz compinit && compinit

# Lines added by shippr-cli installer
if [ $commands[shippr] ]; then
  source <(shippr completion zsh)
fi
# End of lines added by shippr-cli installer

# Created by `pipx` on 2022-08-23 12:31:54
export PATH="$PATH:/Users/Philippa.Main/.local/bin"

#Golang
export PATH="$PATH:$HOME/go/bin/:/usr/local/opt/go@1.17/bin"
