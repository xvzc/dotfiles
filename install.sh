#!/bin/sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Detected OS: ${machine}"

if [ "$machine" == "Mac" ]; then

    if type brew > /dev/null 2>&1; then
        echo "Found brew at $(whareis brew). Skipping install."
    else
        sudo -v --prompt "Administrator privilege required. Please type your local password: "
        # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
        echo "homdbrew not found. installing.."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && \
	    eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    if [ $? -ne 0 ]; then
        echo "Filed to install brew"
	exit 1;
    fi

    echo "Installing MacOS packages.."
    brew install chezmoi && chezmoi init github.com/xvzc/dotfiles
    if [ $? -ne 0 ]; then
        echo "Filed to initialize dotfiles"
	exit 1;
    fi

    
    brew bundle --file=~/.local/share/chezmoi/Brewfile && chezmoi apply -R
    if [ $? -ne 0 ]; then
        echo "Filed to apply dotfiles"
	exit 1;
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Installing Linux packages.."
    yay -S --needed --noconfirm - < ~/.local/share/chezmoi/aur_packages.txt

    #################################################################
    #                                                               #
    # INSTALL NIMF HERE                                             #
    # - https://github.com/hamonikr/nimf                            #
    #                                                               #
    # INSTALL ROFI THEMES HERE                                      #
    # - https://github.com/Murzchnvok/rofi-collection               #
    #                                                               #
    #################################################################
else
   echo "Cannot determine operation system."
   exit 1;
fi


