#!/bin/bash

echo "## APPLYING CHEZMOI ##"
chezmoi apply
echo "## DONE APPLYING CHEZMOI ##"
echo "## Applying HOMEMANAGER CONFIGURATION ##"
home-manager switch --flake $HOME/.local/share/chezmoi/
echo "## DONE APPLYING HOMEMANAGER CONFIGURATION ##"
