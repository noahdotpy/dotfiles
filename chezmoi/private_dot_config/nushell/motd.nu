# Nushell Autorun File

smallfetch --logo none

try { kjv (^sort -R $"($env.HOME)/.local/share/zsh-bible/verses" | head -n 1) | cowsay | head -n -5 | lolcat -S 25 }

