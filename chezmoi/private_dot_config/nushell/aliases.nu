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

# Wrapper for `yazi`
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# changes dir to one found from `zoxide query`, then starts $env.EDITOR
def cde [query] {
  let real = zoxide query $query
  cd $real
  ^$env.EDITOR .
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
