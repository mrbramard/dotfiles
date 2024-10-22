vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "typescript", "yaml", "css", "scss", "markdown", "tsx" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')

vim.o.background="dark"
vim.cmd([[colorscheme gruvbox]])
