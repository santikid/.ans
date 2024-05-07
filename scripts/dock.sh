#!/bin/bash

apps=(
    "/Applications/Safari.app"
    "/Applications/Mail.app"
    "/Applications/Alacritty.app"
    "/Applications/Ferdium.app"
)

check () {
    if ! command -v dockutil &> /dev/null
    then
        echo "dockutil not found; please install through homebrew"
        exit 1
    fi
}

set_apps() {
    dockutil --remove all

    sleep 7

    for a in ${apps[@]}
    do
        dockutil -a $a --no-restart
        sleep 1
    done
}

settings () {
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -int 0
    defaults write com.apple.dock orientation left
}

check
settings
set_apps
killall Dock
