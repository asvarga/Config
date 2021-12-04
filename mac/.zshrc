
###############
# CLOUD STUFF #
###############

CLOUDHOST=dev-dsk-vrgnv-1e-51d87276.us-east-1.amazon.com
TIMBERHOST=bts-rtod-prod-iad-timber-1a-18734fb9.us-east-1.amazon.com
CLUSTERID=94afe5f5-e40d-43d2-acea-146137bdfcf2 #bfe7120c-4a7c-4741-bb42-1627a4610029

#############
# ZSH STUFF #
#############

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/vrgnv/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

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
plugins=(git zsh-autosuggestions)

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


# set_terminal_tab_title() {
#   print -Pn "\e]1;$1:q\a"
# }
# indicate_tmux_session_in_terminal() {
#   set_terminal_tab_title "$(tmux display-message -p '#S')"
# }
# precmd_functions=($precmd_functions indicate_tmux_session_in_terminal)


###############
# OTHER STUFF #
###############

export PATH=$HOME/.toolbox/bin:$PATH
export PATH=$HOME/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

alias e=emacs
alias bb=brazil-build

alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'

alias third-party-promote='~/.toolbox/bin/brazil-third-party-tool promote'
alias third-party='~/.toolbox/bin/brazil-third-party-tool'

export WORKPLACE=$HOME/workplace
export WP=$WORKPLACE
export SYNC=$WORKPLACE/sync
export PATH=$WORKPLACE/BluNativeToolKit/build/BluNativeToolkitCpp/BluNativeToolkitCpp-1.2/AL2012/DEV.STD.PTHREAD/build/bin:$PATH

alias fix='pushd $WORKPLACE/BNTK2/src/BluNativeToolkitCpp/ && export LD_LIBRARY_PATH=$(brazil-path run.lib) && popd'
alias fix2='pushd $WORKPLACE/TokenizationThraxUTF8/src/TokenizationThraxUTF8/ && export LD_LIBRARY_PATH=$(brazil-path run.lib) && popd'

################
### My Stuff ###
################

# PROMPT='%K{blue}%F{black} %1~ %k%F{blue}%f '
PROMPT='%K{blue}%F{black}[ %1~ ];%k%f '
# PROMPT='%F{blue}[ %1~ ];%f '

# export VISUAL='code'    # set vs code as default editor (ex: git commit messages)

# some more ls aliases
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# aliases
alias szsh='source ~/.zshrc'
alias ozsh='code ~/.zshrc'

alias gits='git status'
alias gitp='echo "use cr"'    #'git push'
alias gitpl='git pull'
# alias gitca='git commit -a -m'
alias gita='git add .'
alias gitam='git commit --amend'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd~='cd ~'

alias brewi='brew install'

alias p="pushd"
alias pp="popd"

alias py='python3'

alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree='tree3'

alias hl='highlight'

alias moosesay='cowsay -f moose'
alias moosethink='cowthink -f moose'
alias wtf="paste <(paste <(cowthink oom) <(yes ' ' | head -n 8) | column -s $'\t' -t | rev) <(cowsay moo) | moosethink -ng | lolcat -F 0.5"
alias cow='f(){ figlet "$@" | cowsay -n | lolcat -F 0.5;  unset -f f; }; f'
alias moose='f(){ figlet "$@" | moosesay -n | lolcat -F 0.5;  unset -f f; }; f'

alias cloud='ssh $USER@$CLOUDHOST'
alias dcv='dcv-cdd.py connect $CLOUDHOST'
# alias cloudsync='rsync -a ~/sync $CLOUDHOST:~'
# alias csync='cloudsync'
alias l2c='local2cloud'
alias c2l='cloud2local'
alias cloudsync='local2cloud'

alias timber='ssh $TIMBERHOST'

alias cdwp='cd ~/workplace'

alias cex='ssh $USER@$CLOUDHOST pushd $(cpwd) &&'

alias yab='brew services start koekeishiya/formulae/yabai'

alias uni='launchctl unload ~/Library/LaunchAgents/local.unison-file-sync.plist && launchctl load ~/Library/LaunchAgents/local.unison-file-sync.plist'

alias novajp="nova --profile asr_pdx cluster create --tags \"Program:Transformer Model Experiments, Locale:ja-JP\""
alias jpnova=novajp
alias jpsync="nova --profile asr_pdx cluster rsync --cluster-name $CLUSTERID $WORKPLACE/Dory-BlueShift-Speech/src/Dory-BlueShift-Speech /home/ec2-user/workspace/"

alias wm="brew services restart yabai; brew services restart skhd"

alias hsync="nova cluster rsync --cluster-name $CLUSTERID $WORKPLACE/Dory-BlueShift-Speech/src/AlexaFrictionAnalyzer /home/ec2-user/workspace/"

alias bell="tput bel"

alias awsa="aws --profile admin"

export PATH=~/sync/bin:$PATH
export PATH=$PATH:./node_modules/.bin

export PYTHONPATH=$PYTHONPATH:~/workspace/Dory-BlueShift-Speech/src/AlexaFrictionAnalyzer/src

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# init
# alias welcome="clear && figlet 'Welcome!' | moose -n | lolcat -F 0.5"
alias welcome="clear && moose 'Welcome!'"
welcome

