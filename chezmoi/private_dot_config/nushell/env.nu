# Nushell Environment File

source /etc/nushell/profile

use std *

path add $"($env.HOME)/.local/bin/"
path add "/var/lib/flatpak/exports/bin/"

$env.EDITOR = "hx"
$env.HOME = "/var/home/noah/" # fix the prompt not realizing that /var/home/noah is the same as /home/noah

$env.JQ_LIB_DIR = "/usr/lib64/libjq.so"

zoxide init nushell --cmd cd | save -f ~/.cache/zoxide.nu
source ~/.cache/zoxide.nu
