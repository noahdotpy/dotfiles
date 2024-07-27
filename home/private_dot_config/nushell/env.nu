# Nushell Environment File

source /etc/nushell/profile

zoxide init nushell --cmd cd | save -f ~/.cache/zoxide.nu
source ~/.cache/zoxide.nu