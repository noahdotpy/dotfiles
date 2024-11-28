<div align="center">

# My /home managed with Chezmoi :house_with_garden: and Home Manager :snowflake:&nbsp;
## Used with [my Fedora Atomic image](https://github.com/noahdotpy/myublue) 💻️

</div>

## Usage

If you store this repo in a location other than `~/.local/share/chezmoi/` you should make a symlink that targets the different location, with the link name being `~/.local/share/chezmoi/`:

```bash
ln -s ~/my/myhome/ ~/.local/share/chezmoi/
```

### Chezmoi:

```bash
chezmoi apply
```

### Nix Home Manager:

```bash
nix run 'github:nix-community/home-manager' -- switch --flake '.'
```
