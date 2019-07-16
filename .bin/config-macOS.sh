#!/bin/bash
#
# Configure macOS.

# Display usage.
usage() {
cat <<EOM
Usage: $(basename "$0") OPTIONS

Options:
    -a, --all       configure everything
    -d, --dock      configure Dock
    -h, --help      show this help
EOM
}

# Display help if no options are specified.
[[ $# -eq 0 ]] && usage && exit 2

# Loop through options and set variables accordingly.
while getopts ":adh-:" arg;
do
    case $arg in
        -) # Use long options too.
            case "${OPTARG}" in
                all) all=true;;
                dock) dock=true;;
                help) usage && exit 0;;
                *) usage && exit 2;;
            esac;;
        a) all=true;;
        d) dock=true;;
        h) usage && exit 0;;
        \?) usage && exit 2;;
    esac
done

##
# Configure Dock.
#
configure_dock() {
    echo "Configuring dock."

    # Set icon size in dock.
    defaults write com.apple.dock tilesize -int 35

    # Show indicators for open applications in the dock.
    defaults write com.apple.dock show-process-indicators -bool true

    # Change autohide dock delay.
    defaults write com.apple.dock autohide-delay -float 0

    # No animation when showing/hiding the dock.
    defaults write com.apple.dock autohide-time-modifier -float 0

    # Restart the dock.
    killall Dock
}

[[ -n "$dock" ]] && configure_dock

###
# Configure everything.
#
configure_all() {
    configure_dock
}

[[ -n "$all" ]] && configure_all

exit 0
