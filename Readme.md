# .stowfiles
A repository for dotfiles and settings.
GNU software stow is used to easily make symlinks of personally configured dotfiles.

# clone
`git clone --recurse-submodules https://github.com/xvzc/.stowfiles`

## Multiple github account?
set the remote url of the local git repository like below.  
`git remote set-url origin https://xvzc@github.com/xvzc/REPO_NAME.git`


# stow
- `stow $folder_name` makes symlinks of files inside the folder.
- `stow -D $folder_name` removes symlinks that has been already made.

# Terminal environment

## Dependencies
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

## Cross platform settings
 A variable which indicates the current OS will be set dynamically on shell startup.  
See `$echo CUR_OS`


## How to get .tmux.reset.conf
```bash
$ tmux -f /dev/null -L temp start-server \; list-keys > ./.tmux.reset.conf

```

# Window manager environmetn (For Arch Linux)
```
- bspwm                  # window manager
- polybar                # for top bar.
- xorg, xorg-xinit       # for keyborad input settings.
- compton(picom)         # A compositor that gives each window a buffer to render
- nitrogen               # Background image manager
- ibus-hangul            # korean input source
- xdo                    # a utility that enables showing and hiding applications
```

# Make ALT_R work as ALT_R in Hangul layout (For Arch Linux)
```
cd /usr/share/X11/xkb/symbols
sudo vim kr

```
find 'ralt_hangul' key, and then change the symbols to `symbols[Group1] = [ Alt_R, Meta_R ] };`
