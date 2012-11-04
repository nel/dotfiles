# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew)
# Use homebrew zsh path
[[ -s  /usr/local/share/zsh/ ]] && fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh/functions $fpath)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

#git status is insanely slow in case of big project with a lot of submodule.
##The git prompt check the state of the repository (dirty or not) and do a git
##status for that, it thus add a noticable delay. I avoid it by monkey patching
##the shell fct, git repo is always clean (this is what is the best THEME wise)
parse_git_dirty () { echo "$ZSH_THEME_GIT_PROMPT_CLEAN" }

#PATH, EDITOR, ...
source $HOME/.env

#alias
source $HOME/.aliases

[[ -s  $HOME/.zshrc.local ]] && .  $HOME/.zshrc.local
