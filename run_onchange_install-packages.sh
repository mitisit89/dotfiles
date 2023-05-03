{{ if eq .chezmoi.os "linux" -}} 
#!/bin/sh
mkdir ~/.local/state/{bash,zsh} 
mkdir ~/.local/bin/
{{ else if eq .chezmoi.osRelease.id "pop" -}}
#!/bin/sh
sudo apt install -y ripgrep fzf curl
 
NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
NVIM_DEST="$HOME/.local/bin/nvim"
curl -L $NVIM_URL | tar xz --strip-components=1 -C $NVIM_DEST
chmod u+x $NVIM_DEST/nvim
{{end}}

