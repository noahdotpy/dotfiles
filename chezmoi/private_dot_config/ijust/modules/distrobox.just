# vim: set ft=make :

alias assemble := distrobox-assemble

# Create distroboxes from a defined manifest
distrobox-assemble CONTAINER="prompt" ACTION="create" FILE="~/.config/distrobox/assemble.ini":
    #!/usr/bin/bash
    # Distroboxes are gathered from assemble.ini, please add them there
    source /usr/lib/ujust/ujust.sh
    AssembleList {{ FILE }} {{ ACTION }} {{ CONTAINER }}
