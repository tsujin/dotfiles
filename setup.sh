#!/bin/bash

# Vim setup
VIMRC_TARGET="$HOME/.vimrc"
VIMRC_LINK="$HOME/dotfiles/vim/.vimrc"

ln -s "$VIMRC_LINK" "$VIMRC_TARGET"

if [ -L "$VIMRC_TARGET" ]; then
    echo "Link '$VIMRC_TARGET' created successfully."
else
    echo "Failed to create link for '$VIMRC_TARGET'."
fi
