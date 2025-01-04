local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ -- Plugin specifications
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("config.theme").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require('config.plugins.lsp')
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("config.plugins.lualine").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("config.plugins.which-key").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace "*" by the latest version number
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" },
    config = function()
      require('config.plugins.completion').setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons" -- Add this for better icons
    },
    config = function()
      require("config.plugins.telescope").setup()
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("config.plugins.treesitter").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,                      -- Enable treesitter
        ts_config = {
          lua = { 'string' },                 -- Don't add pairs in lua string treesitter nodes
          javascript = { 'template_string' }, -- Don't add pairs in javascript template_string
        },
        disable_filetype = { "TelescopePrompt" },
        enable_check_bracket_line = true, -- Don't add pairs if it already has a close pair in the same line
        ignored_next_char = "[%w%.]",     -- Don't add pairs if the next char is alphanumeric
        enable_afterquote = true,         -- add bracket pairs after quote
        enable_moveright = true,          -- enable moveright
        enable_bracket_in_quote = true,
        fast_wrap = {
          map = '<M-e>', -- Alt+e to fast wrap the pair
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          manual_position = true,
          highlight = 'Search',
          highlight_grey = 'Comment'
        },
      })

      -- Integration with nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        },
        hint_enable = true, -- Shows parameter hints inline
        hint_prefix = "🔍 ", -- Prefix for parameter hints
        hint_scheme = "String", -- Highlight group for hints
        hi_parameter = "Search", -- Highlight group for current parameter
        max_height = 12, -- Max height of signature floating window
        max_width = 120, -- Max width of signature floating window
        wrap = true, -- Wrap long signatures
        floating_window = true, -- Show floating window for signatures
        floating_window_above_cur_line = true, -- Try to place window above cursor line
        toggle_key = "<C-k>", -- Toggle signature window with Ctrl-k
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        -- Enable line and block comment toggling
        toggler = {
          line = 'gcc',  -- Line-comment toggle keymap
          block = 'gbc', -- Block-comment toggle keymap
        },
        -- Enable operator-pending mappings
        opleader = {
          line = 'gc',  -- Line-comment keymap
          block = 'gb', -- Block-comment keymap
        },
      })
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.icons').setup()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.plugins.nvim-tree").setup()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('config.plugins.gitsigns').setup()
    end
  }
})
