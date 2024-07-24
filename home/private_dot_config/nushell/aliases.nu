# Nushell Alias File

# TODO: Switch to `ugum choose` for choosing which option
# Container shortcuts
export def '@' [choice = "", params = ""] {
  let name = $choice
  if $name == "" {
    let distroboxes = distrobox list | tail -n +2 | cut -d '|' -f2 | xargs | split row ' '
    let choices = $distroboxes | append "host"
    let name = ugum choose ...$choices
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
alias image = rpm-ostree
alias g = git
alias lg = lazygit

export def e [params] {
    ^$"($env.EDITOR)" $params
}
