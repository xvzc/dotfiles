# (MacOS) Install yabai

## Create certificate
(How to create certificate for yabai)[https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)]

## Uninstall previous version
```sh
brew uninstall koekeishiya/formulae/yabai
```

## Install HEAD
```sh
brew install koekeishiya/formulae/yabai --HEAD
```

## Sign certification
```sh
codesign -fs 'yabai-cert' $(brew --prefix yabai)/bin/yabai
```

## Enable script addition
```sh
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

```

# (Arch Linux) Graphic Driver
## AMD
```bash
yay -S xf86-video-amdgpu
```

> /etc/X11/20-amdgpu.conf
```
Section "OutputClass"
     Identifier "AMD"
     MatchDriver "amdgpu"
     Driver "amdgpu"
     Option "TearFree" "true"
     Option "VariableRefresh" "true"
     Option "AsyncFlipSecondaries" "true" #multimonitor setup, but at least one is not FreeSync capable
EndSection
```

# (Arch Linux) Set locale
```bash
sudo locale-gen en_US.UTF-8
echo 'LANG=en_US.UTF-8' | sudo tee -a /etc/environment > /dev/null
```

# (Arch Linux) Automatically enable bluetooth connection
```bash
# Dependencies: yay -Sy bluez bluez-utils
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
bluetoothctl
# [bluetoothctl] power on
# [bluetoothctl] agent on
# [bluetoothctl] default-agent
# [bluetoothctl] scan on
# [bluetoothctl] devices
# Look up mac address
# [bluetoothctl] trust $MAC_ADDRESS
# [bluetoothctl] pair $MAC_ADDRESS
# [bluetoothctl] connect $MAC_ADDRESS

sudo nvim /etc/bluetooth/main.conf
# uncommecnt AutoEnable=true
```

# (Arch Linux) Enable SSH Agent Forwarding
```bash
sudo vim/etc/ssh/sshd_config
# AllowAgentForwarding yes
```

