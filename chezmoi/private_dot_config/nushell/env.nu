# Nushell Environment File

source /etc/nushell/profile

use std *

path add $"($env.HOME)/.local/bin/distrobox-exported/"
path add $"($env.HOME)/.local/share/flatpak/exports/bin/"
path add $"($env.HOME)/go/bin/"

zoxide init nushell | save -f ~/.cache/zoxide.nu