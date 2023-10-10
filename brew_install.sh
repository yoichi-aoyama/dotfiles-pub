#!/bin/bash
set -e

if [ ! -f /usr/local/bin/brew ]; then
    echo "Installing"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Installed."
fi
