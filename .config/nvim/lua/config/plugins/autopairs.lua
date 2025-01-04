local M = {}

function M.setup()
    require("nvim-autopairs").setup({
        check_ts = true,                  -- Enable treesitter
        ts_config = {
            lua = { 'string' },           -- Don't add pairs in lua string treesitter nodes
            javascript = { 'template_string' }, -- Don't add pairs in javascript template_string
        },
        disable_filetype = { "TelescopePrompt" },
        enable_check_bracket_line = true, -- Don't add pairs if it already has a close pair in the same line
        ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
        enable_afterquote = true,     -- add bracket pairs after quote
        enable_moveright = true,      -- enable moveright
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

return M
