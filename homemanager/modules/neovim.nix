{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
with lib; let
  cfg = config.modules.neovim;
in {
  options.modules.neovim = {enable = mkEnableOption "neovim";};

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      neovide
    ];
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        ccls
        clang
        clang-tools
        fzf
        gnumake
        gofumpt
        gopls
        lldb_15
        luajit
        nodePackages."@astrojs/language-server"
        nodePackages.pyright
        nodePackages.svelte-language-server
        nodePackages.typescript-language-server
        nodePackages.vscode-html-languageserver-bin
        nodejs
        ripgrep
        rnix-lsp
        rust-analyzer
        rustfmt
        sumneko-lua-language-server
        tree-sitter
        vala
        vala-language-server
      ];
    };
  };
}
