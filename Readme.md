# dotfiles
A repository for personal dotfiles. uses [chezmoi](https://github.com/twpayne/chezmoi) to manage cross platform environment.

# chezmoi init
`chezmoi init https://github.com/xvzc/dotfiles`

# Dependencies
## Terminal environment
```
zsh
oh-my-zsh
node
packer
tmux
oh-my-tmux
fzf
ripgrep
sdkman
```

## Window manager environment (For Arch Linux)
```
- bspwm                  # window manager
- polybar                # for top bar.
- xorg, xorg-xinit       # for keyborad input settings.
- compton(picom)         # A compositor that gives each window a buffer to render
- nitrogen               # Background image manager
- ibus-hangul            # korean input source
- xdo                    # a utility that enables showing and hiding applications
```

# Trouble shooting log
## Make ALT_R work as ALT_R in Hangul layout (For Arch Linux)
```
cd /usr/share/X11/xkb/symbols
sudo vim kr

```
find 'ralt_hangul' key, and then change the symbols to `symbols[Group1] = [ Alt_R, Meta_R ] };`

## How to get .tmux.reset.conf
```bash
$ tmux -f /dev/null -L temp start-server \; list-keys > ./.tmux.reset.conf

```
