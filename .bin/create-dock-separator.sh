#!/bin/bash
#
# Create dock separator.


defaults write com.apple.dock persistent-apps -array-add '{title-data={}; tile-type="spacer-tile";}'
killall Dock
