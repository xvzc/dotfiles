# require sudo
# Reference https://github.com/wookayin/dotfiles/blob/master/etc/macos-setup.sh

require-sudo() {
	sudo -v --prompt "Administrator privilege required. Please type your local password: "

	# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

_ignore_error() { return 0; }

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

	# Always show scrollbars (`WhenScrolling`, `Automatic` and `Always`)
	defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

	# Do not use OSX credential store for git
	git config --system --unset credential.helper || _ignore_error
}

configure_keyboard() {
	# Check out the current keymap with the command below
	# ┌──────────────────────────────────────────┐
	# │  defaults read com.apple.symbolichotkeys │
	# └──────────────────────────────────────────┘

	# F1, F2, etc. behave as standard function keys.
	defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

	# Use key repeat instead of the accents menu when holding a key
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	# disable previous input source
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 60 "
  <dict><key>enabled</key><false/></dict>
  "

	# disable spotlight
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
  <dict><key>enabled</key><false/></dict>
  "

	# disable spotlight finder search
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 65 "
  <dict><key>enabled</key><false/></dict>
  "

	# disable mission control
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 36 "
  <dict><key>enabled</key><false/></dict>
  "

	# Map next input source to option + space
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key>
    <dict>
      <key>type</key><string>standard</string>
      <key>parameters</key><array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>524288</integer>
      </array>
    </dict>
  </dict>
  "

	# Map Copy picture of selected area to the clipboard to Ctrl + Cmd + s
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 31 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key>
    <dict>
      <key>type</key><string>standard</string>
      <key>parameters</key><array>
        <integer>115</integer>
        <integer>1</integer>
        <integer>1310720</integer>
      </array>
    </dict>
  </dict>
  "

	# Map caps lock to control
	defaults -currentHost write -g com.apple.keyboard.modifiermapping.0-0-0 -array "
  <dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771300</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer>
  </dict>
  "

	# Replace "₩" to "`" in korean keyboard
	mkdir -p ~/Library/KeyBindings
	echo '{ "₩" = ("insertText:", "`"); }' >~/Library/KeyBindings/DefaultkeyBinding.dict
}

configure_dock() {
	# Make dock auto-hide/show instantly (no animation!)
	# https://apple.stackexchange.com/questions/33600/how-can-i-make-auto-hide-show-for-the-dock-faster
	defaults write com.apple.dock autohide -int 1
	defaults write com.apple.dock autohide-delay -float 0.0
	defaults write com.apple.dock autohide-time-modifier -float 0.4
	defaults write com.apple.dock "orientation" -string "left"
	defaults write com.apple.dock "show-recents" -bool "false"
	defaults write com.apple.dock "mineffect" -string "scale"
	defaults write com.apple.dock "tilesize" -int "36"

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

	# View style (list)
	defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
	# keep folders on top
	defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
	killall Finder
}

configure_menubar() {
	defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d HH:mm\""

	# Remove spotlight
	defaults -currentHost write com.apple.Spotlight "
  <dict><key>MenuItemHidden</key><integer>1</integer></dict>
  "
}

configure_trackpad() {
	defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 1
}

configure_textedit() {
	# disable smartquotes
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	defaults write com.apple.TextEdit "SmartQuotes" -bool "false"
	defaults write com.apple.TextEdit "SmartDashes" -bool false

	killall TextEdit
}

all() {
	require-sudo
	configure_general
	configure_dock
	configure_keyboard
	configure_finder
	configure_menubar
	configure_trackpad
	configure_textedit
	/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
}
