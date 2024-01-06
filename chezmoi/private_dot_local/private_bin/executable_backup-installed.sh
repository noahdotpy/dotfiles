#!/usr/bin/env bash

#
### FLATPAK ###
#
FLATPAK_RESTORE_SCRIPT="$HOME/.local/bin/flatpak-restore.sh"
echo "#!/usr/bin/env bash" >$FLATPAK_RESTORE_SCRIPT
echo "FLATPAKS_TO_INSTALL=\"$(flatpak list --app --columns=application | tail -n+1 | tr '\n' ' ')\"" >>$FLATPAK_RESTORE_SCRIPT
echo "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user" >>$FLATPAK_RESTORE_SCRIPT
echo "flatpak install --assumeyes --user --app \$FLATPAKS_TO_INSTALL" >>$FLATPAK_RESTORE_SCRIPT
chmod +x $FLATPAK_RESTORE_SCRIPT
