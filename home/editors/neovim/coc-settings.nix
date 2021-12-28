{
  "languageserver" = {
    "ccls" = {
      "command" = "ccls";
      "filetypes" = ["c" "cc" "cpp" "c++" "objc" "objcpp"];
      "rootPatterns" = [".ccls" "compile_commands.json" ".git/" ".hg/"];
    };

    "nix" = {
      "command" = "rnix-lsp";
      "filetypes" = [ "nix" ];
    };
  };

  "yank.highlight.duration" = 700;
}

