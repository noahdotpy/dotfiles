export project_root := `git rev-parse --show-toplevel`

_default:
    @just --list --list-heading $'Available commands:\n' --list-prefix $' - '

# Check Just Syntax
just-check:
    #!/usr/bin/bash
    find "${project_root}" -type f -name "*.just" | while read -r file; do
    	echo "Checking syntax: $file"
    	just --unstable --fmt --check -f $file 
    done
    echo "Checking syntax: ${project_root}/justfile"
    just --unstable --fmt --check -f ${project_root}/justfile

# Fix Just Syntax
just-fix:
    #!/usr/bin/bash
    find "${project_root}" -type f -name "*.just" | while read -r file; do
    	echo "Checking syntax: $file"
    	just --unstable --fmt -f $file
    done
    echo "Checking syntax: ${project_root}/justfile"
    just --unstable --fmt -f ${project_root}/justfile || { exit 1; }

alias ch := chezmoi
alias hm := home-manager
alias hm-b := home-manager-backup

chezmoi:
  chezmoi apply

home-manager:
  /nix/var/nix/profiles/default/bin/nix run 'github:nix-community/home-manager' -- switch --flake {{ project_root }}

home-manager-backup:
  /nix/var/nix/profiles/default/bin/nix run 'github:nix-community/home-manager' -- switch --flake {{ project_root }} -b backup
