local map = vim.keymap.set

-- General mappings
map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })

-- Telescope mappings
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help tags' })

-- File explorer mappings
map('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle Explorer' })
map('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus Explorer' })
map('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh Explorer' })


-- LSP mappings (will be set up in lsp config)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Go to definition' })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Go to references' })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Hover documentation' })
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code action' })

-- Navigation
map('n', '<leader>[', '<C-o>', { desc = 'Jump back' })
map('n', '<leader>]', '<C-i>', { desc = 'Jump forward' })

-- Search mappings
map('n', '<leader>nh', ':nohlsearch<CR>', { desc = 'Clear search highlights' })
map('n', '<leader>*', '*``', { desc = 'Search word under cursor' })

-- Using telescope for enhanced in-file search
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search in current file' })
map('n', '<leader>fw', '<cmd>Telescope grep_string<cr>', { desc = 'Search current word' })
map('n', '<leader>fW', '<cmd>Telescope grep_string search=<cr>', { desc = 'Search current word in project' })

-- Optional: Make search results appear in middle of screen
map('n', 'n', 'nzzzv', { desc = 'Next search result' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result' })

-- Command palette-like mappings
map('n', '<leader>:', '<cmd>Telescope commands<cr>', { desc = 'Commands' })
map('n', '<C-p>', '<cmd>Telescope commands<cr>', { desc = 'Command Palette' })

-- Alternative comment keymaps
map('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true }) -- leader + / for normal mode
map('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })  -- leader + / for visual mode

-- Auto wrap mappings
map('v', '<leader>w"', 'c""<Esc>P', { desc = 'Wrap with double quotes' })
map('v', "<leader>w'", "c''<Esc>P", { desc = 'Wrap with single quotes' })
map('v', '<leader>w`', 'c``<Esc>P', { desc = 'Wrap with backticks' })
map('v', '<leader>w)', 'c()<Esc>P', { desc = 'Wrap with parentheses' })
map('v', '<leader>w]', 'c[]<Esc>P', { desc = 'Wrap with brackets' })
map('v', '<leader>w}', 'c{}<Esc>P', { desc = 'Wrap with braces' })
map('v', '<leader>w>', 'c<><Esc>P', { desc = 'Wrap with angle brackets' })

-- Diagnostic keymaps
map('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Show diagnostic error' })
map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
