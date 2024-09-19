# Nushell Environment File

source /etc/nushell/profile

use std *

path add $"($env.HOME)/.local/bin/"

$env.EDITOR = "nvim"

zoxide init nushell --cmd cd | save -f ~/.cache/zoxide.nu
source ~/.cache/zoxide.nu
