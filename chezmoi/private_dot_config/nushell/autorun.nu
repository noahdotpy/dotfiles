# Nushell Autorun File

smallfetch --logo none

try { kjv (^sort -R $"($env.HOME)/.local/share/zsh-bible/verses" | head -n 1) | cowsay | head -n -5 | lolcat -S 25 }

def start_zellij [] {
  if 'ZELLIJ' not-in ($env | columns) {
    if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
      zellij attach -c
    } else {
      zellij
    }

    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
      exit
    }
  }
}

start_zellij

