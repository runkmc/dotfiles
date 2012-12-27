# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(github git)

alias rea=reattach-to-user-namespace -l
source $HOME/.wunderground.sh
source $ZSH/oh-my-zsh.sh
source $ZSH/paths.sh
# Customize to your needs...
# export PATH=/Users/kevin/.rvm/gems/ruby-1.9.3-p194/bin:/Users/kevin/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/kevin/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/kevin/.rvm/bin:/usr/local/git/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/Users/kevin/bin:/Users/kevin/.cabal/bin:/Users/kevin/.rvm:/Users/kevin/Library/Haskell/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin
