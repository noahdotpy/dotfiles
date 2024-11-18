<div align="center">

# My dotfiles managed with Chezmoi :house_with_garden: and Home Manager :snowflake:&nbsp;
## Used with [my Fedora Atomic image](https://github.com/noahdotpy/myublue) 💻️

</div>

## Use

### Chezmoi:

```bash
chezmoi init noahdotpy/mydotfiles --apply
```

### Nix Home Manager:

`nix run .` runs home-manager as if it was installed.

This means you can do `nix run . -- switch --flake .` to apply the home manager configuration directly. This would be just like doing `home-manager switch --flake .`
