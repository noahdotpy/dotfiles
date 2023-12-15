#!/bin/bash

chezmoi apply && home-manager switch --flake $HOME/.local/share/chezmoi/
