export PATH
export EDITOR='nvim'
export TERMINAL='alacritty'
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
#export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export BROWSER='firefox'
export VISUAL="nvim"
export COLORTERM="truecolor"
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$XDG_DATA_HOME"/go 
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup 
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc  
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
RANGER_LOAD_DEFAULT_RC=FALSE 

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
