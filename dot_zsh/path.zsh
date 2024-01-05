# PATHS
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

_is_darwin && export PATH="/opt/homebrew/bin:$PATH"

command -v go &> /dev/null && export PATH=${PATH}:`go env GOPATH`/bin
command -v bob &> /dev/null && export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

