local M = {}

function M.setup()
    local wk = require("which-key")
    wk.setup {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "left",
        },
    }

    -- Updated key mappings to the new spec
    wk.add({
        { "<leader>*",  desc = "Search word under cursor" },
        { "<leader>/",  desc = "Comment Out Line" },
        { "<leader>:",  desc = "Command Palette" },
        { "<leader>c",  group = "Code" },
        { "<leader>ca", desc = "Code Action" },
        { "<leader>ch", desc = "Clear Highlights" },
        { "<leader>d",  group = "Diagnostic" },
        { "<leader>dd", desc = "Show diagnostic detail" },
        { "<leader>dl", desc = "List diagnostics" },
        { "<leader>dn", desc = "Next diagnostic" },
        { "<leader>dp", desc = "Previous diagnostic" },
        { "<leader>e",  group = "Explorer" },
        { "<leader>ee", "<cmd>NvimTreeToggle<cr>",                      desc = "Toggle Explorer" },
        { "<leader>ef", "<cmd>NvimTreeFocus<cr>",                       desc = "Focus Explorer" },
        { "<leader>er", "<cmd>NvimTreeRefresh<cr>",                     desc = "Refresh Explorer" },
        { "<leader>f",  group = "Find" },
        { "<leader>fW", desc = "Search word in project" },
        { "<leader>fb", desc = "Find Buffer" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find File" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
        { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in file" },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>",               desc = "Search current word" },
        { "<leader>w",  group = "Wrap" },
        { '<leader>w"', desc = "Wrap with double quotes" },
        { "<leader>w'", desc = "Wrap with single quotes" },
        { "<leader>w)", desc = "Wrap with parentheses" },
        { "<leader>w>", desc = "Wrap with angle brackets" },
        { "<leader>w]", desc = "Wrap with brackets" },
        { "<leader>w`", desc = "Wrap with backticks" },
        { "<leader>w}", desc = "Wrap with braces" },
    })
end

return M
