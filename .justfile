apply:
  ## Applying homemanager and chezmoi configuration ##
  (cd ~/.local/share/chezmoi && chezmoi apply; home-manager switch --flake .)

hm-apply:
  ## Applying homemanager configuration ##
  (cd ~/.local/share/chezmoi && home-manager switch --flake .)
