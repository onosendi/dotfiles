#!/bin/bash
#
# Configure macOS

##
# Dock
#

# Set icon size in dock.
defaults write com.apple.dock tilesize -int 36

# Show indicators for open applications in the dock.
defaults write com.apple.dock show-process-indicators -bool true

# Change autohide dock delay.
defaults write com.apple.dock autohide-delay -float 0

# No animation when showing/hiding the dock.
defaults write com.apple.dock autohide-time-modifier -float 0

# Restart the dock.
killall Dock
