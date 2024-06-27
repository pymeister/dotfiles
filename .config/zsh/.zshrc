#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------

#   Set Paths
#   ------------------------------------------------------------
# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
# Android
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"

# AWS CLI
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# Bash History
export HISTFILE="${XDG_STATE_HOME}/bash/history"

# BPython
export BPYTHON_CONFIG="$XDG_CONFIG_HOME/bpython/config"

# Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Emacs
export EMACSDIR="$XDG_CONFIG_HOME/emacs"

# Gem
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# GNUPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# IPython
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"

# Jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# MPlayer
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"

# Msmtp
export MSMTP_CONFIG="$XDG_CONFIG_HOME/msmtp/config"

# Nano
export NANORC="$XDG_CONFIG_HOME/nano/nanorc"

# Notmuch
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/default/config"

# NPM
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME/npm/config/npm-init.js"

# Oh My Zsh
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"

# Taskwarrior
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export TASKDATA="$XDG_DATA_HOME/task"

# Tmux
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"

export PYTHONPATH=/opt/homebrew/opt/pillow/lib/python3.12/site-packages:$PYTHONPATH

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export GPG=/opt/homebrew/bin/gpg
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export PROJECT_HOME=$HOME/dev/
export PATH_TO_FX=/Users/kermitfrog19/dev/SDK/javafx-sdk-21.0.1/lib
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export ALTERNATE_EDITOR="em"
export EDITOR="nvim"                  # $EDITOR opens in terminal
export VISUAL="nvim"         # $VISUAL opens in GUI mode
export PATH="/opt/homebrew/Cellar/python@3.11/3.11.2_1:$PATH"
export pkg_config_path="/opt/homebrew/lib/pkgconfig"
export cppflags="-i/opt/x11/include"
export ldflags="-l/opt/x11/lib"


# English Language 
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# German Language
# export LANG="de_DE.UTF-8"
# export LC_COLLATE="de_DE.UTF-8"
# export LC_CTYPE="de_DE.UTF-8"
# export LC_MESSAGES="de_DE.UTF-8"
# export LC_MONETARY="de_DE.UTF-8"
# export LC_NUMERIC="de_DE.UTF-8"
# export LC_TIME="de_DE.UTF-8"
# export LC_ALL=

export TERM=xterm-kitty

# Path to your oh-my-zsh installation.
zstyle ':omz:update' mode auto      # update automatically without asking

#
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# User configuration
RPROMPT='$(battery_pct_prompt)'
#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
# Isync
alias mbsync='mbsync -c "$XDG_CONFIG_HOME/isync/mbsyncrc"'

# Wget
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias nano='/opt/homebrew/bin/nano'
alias rt='source "$XDG_CONFIG_HOME/zsh/.zshrc"'
alias ls='eza  --header --no-permissions --no-user  --git --icons=always'
alias la='eza  --all -a --header --no-permissions --no-user --no-time --git --icons=always'
# alias lla='ls -la'
alias lt='eza --tree'
alias edit="nvim"
alias zshconfig='nvim "$XDG_CONFIG_HOME/zsh/.zshrc"'
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias emser='emacs --daemon &'
alias em="emacsclient -c -a emacs"
alias doom="~/.emacs.d/bin/doom"
alias python='python3'
alias pip='pip3'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@" && ls; }          # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
# trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
# Django Alias's
# -----------------

alias runserver='python manage.py runserver'
alias makemigrations='python manage.py makemigrations'
alias migrate='python manage.py migrate'
alias createsuperuser='python manage.py createsuperuser'
alias shell_plus='python manage.py shell_plus --ipython'
alias collectstatic='python manage.py collectstatic'
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }


#   -------------------------------
#   5. VERTUAL ENVIRONMENT CONFIGURATION
#   -------------------------------


#   -------------------------------
#   6. Terminal Display Art
#   -------------------------------

#neofetch
### RANDOM COLOR SCRIPT ###
colorscript random
#curl de.wttr.in
#curl de.wttr.in/moon
# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
# Source fzf configuration

[ -f "$XDG_CONFIG_HOME/.fzf.zsh" ] && source "$XDG_CONFIG_HOME/.fzf.zsh"


# Set up fzf key bindings and fuzzy completion

# --- setup fzf theme ---
 fg="#f8f8f2"
 bg="-1"
 bg_highlight="#bd93f9"
 purple="#B388FF"
 blue="#06BCE4"
 cyan="#2CF9ED"

 export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},dark,info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME=Dracula

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

plugins=(git battery zsh-syntax-highlighting jsontools autoenv web-search)
# Add RBENV to PATH 
if command -v rbenv &>/dev/null; then eval "$(rbenv init -)"; fi
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/default.omp.json)"
fi
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Source zsh-autosuggestions installed via Homebrew
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/opt/homebrew/Cellar/sdkman-cli/libexec"
[[ -s "/opt/homebrew/Cellar/sdkman-cli/libexec/bin/sdkman-init.sh" ]] && source "/opt/homebrew/Cellar/sdkman-cli/libexec/bin/sdkman-init.sh"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
source $ZSH/oh-my-zsh.sh

