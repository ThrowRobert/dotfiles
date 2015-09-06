# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git debian colored-man tmux colorize command-not-found compleat lol)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/h3xploit/bin"
export EDITOR='emacsclient -c emacs'
export VISUAL='emacsclient -c emacs'
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#xinput set-prop 9 281 -1

export DEBFULLNAME="Robert Sundseth"
export DEBEMAIL="throwrobert@gmail.com"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Personal aliases
alias clr="clear"
alias pdf="evince"
alias countme="find  -maxdepth 1 -type d | wc -l"
alias countdir="find -type f | wc -l"
alias usbin="sudo mount /dev/sdb1 /mnt/usbhot/"
alias usbout="sudo umount /mnt/usbhot/"
alias blue="bluetoothctl"
#alias projector="xrandr"
alias moviemode="xset s noblank && xset -dpms && xset s off && echo Movie mode enabled! && echo 500 | sudo tee /sys/class/backlight/intel_backlight/brightness"
alias normalmode="xset +dpms && echo Normal mode enabled! "
# Light mode
alias daymode="echo 937 | sudo tee /sys/class/backlight/intel_backlight/brightness"
alias nightmode="echo 75 | sudo tee /sys/class/backlight/intel_backlight/brightness"
# Network stuff
alias imoff="sudo rfkill unblock all && sudo netctl stop-all"
alias home="sudo rfkill unblock all && sudo netctl switch-to wlp2s0-queen && ip a | grep wlp2s0 | grep inet"
alias school="sudo rfkill unblock all && sudo netctl switch-to wlp2s0-NFK && ip a | grep wlp2s0 | grep inet"
alias andreas="sudo rfkill unblock all && sudo netctl switch-to wlp2s0-privat82011fin && ip a | grep wlp2s0 | grep inet"
