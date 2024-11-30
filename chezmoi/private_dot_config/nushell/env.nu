# Nushell Environment File

source /etc/nushell/profile

use std *

path add $"($env.HOME)/.local/bin/"
path add "/var/lib/flatpak/exports/bin/"
path add "/home/linuxbrew/bin/"

$env.EDITOR = "hx"

$env.JQ_LIB_DIR = "/usr/lib64/libjq.so"

zoxide init nushell --cmd cd | save -f ~/.cache/zoxide.nu
source ~/.cache/zoxide.nu
