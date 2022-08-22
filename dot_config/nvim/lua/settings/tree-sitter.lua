return require('nvim-treesitter.configs').setup {
    ensure_installed = { 
      "c", 
      "cpp", 
      "go",
      "lua",
      "vim",
      "bash",
      "dockerfile",
      "kotlin",
      "java",
      "python",
      "regex",
      "ruby",
      "tsx",
      "typescript",
      "javascript",
      "yaml",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
