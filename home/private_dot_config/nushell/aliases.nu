# Nushell Alias File

# Container shortcuts
export def '@' [choice = "", params = ""] {
  let name = $choice
  if $name == "" {
    let distroboxes = distrobox list | tail -n +2 | cut -d '|' -f2 | xargs | split row ' '
    let choices = $distroboxes | append "host"
    let name = gum choose ...$choices
  }

  if $name == "host" {
    distrobox-host-exec $params
  } else {
    distrobox-enter $name -- $params
  }
}

alias x = clear

alias dots = chezmoi
alias dotsa = chezmoi apply

alias g = git
alias lg = lazygit

alias sysext = systemd-sysext

export def e [...params] {
    ^$env.EDITOR ...$params
}
