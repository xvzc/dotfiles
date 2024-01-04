# require sudo
# Reference https://github.com/wookayin/dotfiles/blob/master/etc/macos-setup.sh

require-sudo() {
  if [ -n "$1" ]; then
    sudo -v --prompt "Administrator privilege required. Please type your local password: "

    # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  fi
}

_set_hostname() {
  local hostname=$1
  require-sudo
  sudo scutil --set ComputerName "$hostname"
  sudo scutil --set HostName "$hostname"
  sudo scutil --set LocalHostName "$hostname"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$hostname"
}


configure_general() {
  # Faster key repeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  defaults write NSGlobalDomain KeyRepeat -int 1

  # Use key repeat instead of the accents menu when holding a key
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Always show scrollbars (`WhenScrolling`, `Automatic` and `Always`)
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

  # Do not use OSX credential store for git
  git config --system --unset credential.helper || ignore-error;
}

configure_dock() {
  # Make dock auto-hide/show instantly (no animation!)
  # https://apple.stackexchange.com/questions/33600/how-can-i-make-auto-hide-show-for-the-dock-faster
  defaults write com.apple.dock autohide -int 1
  # defaults write com.apple.dock autohide-delay -float 0.0
  # defaults write com.apple.dock autohide-time-modifier -float 0.0

  #defaults write com.apple.dock magnification -int 1
  killall Dock
}

configure_finder() {
  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Always show file extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
}

all() {
  configure_general
  configure_dock
  configure_finder
}



