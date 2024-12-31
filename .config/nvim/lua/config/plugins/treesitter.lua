local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "go",
      "javascript",
      "typescript",
      "python",
      "bash",
      "markdown",
      "markdown_inline",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end

return M
