#!/bin/sh
mkdir -p ~/.zsh;
mkdir -p ~/.config/nvim;
mkdir -p ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\ 
	~/.zsh/zsh-syntax-highlighting;

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install;

# install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf

# install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim;


# Linux specific
{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh

sudo yay -Sy ripgrep;
sudo yay -Sy fd;
sudo yay -Sy tmux;

{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh

brew install ripgrep;
brew install fd;
brew install tmux;

{{ end -}}
