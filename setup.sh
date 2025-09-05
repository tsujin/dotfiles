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

# Bashrc
BASHRC_TARGET="$HOME/.bashrc"
BASHRC_LINK="$HOME/dotfiles/bash/.bashrc"

ln -s "$BASHRC_LINK" "$BASHRC_TARGET"

if [ -L "$BASHRC_TARGET" ]; then
    echo "Link '$BASHRC_TARGET' created successfully."
else
    echo "Failed to create link for '$BASHRC_TARGET'."
fi
