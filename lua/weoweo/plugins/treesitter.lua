return {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "cpp", "rust", "javascript", "typescript", "dart", "go", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          auto_install = true,
          highlight = { enable = true, additional_vim_regex_highlighting = false,},
          indent = { enable = true },  
        })
    end
}
