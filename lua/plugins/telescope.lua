local lib = require('lib')

lib.nmap('<C-P>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
lib.nmap('<C-S>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
lib.nmap('<C-E>', "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
lib.nmap('<leader><C-S>', "<cmd>lua require'telescope'.extensions.luasnip.luasnip{}<cr>")
lib.nmap('<leader><C-T>', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
lib.nmap('gR', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
lib.nmap('<leader>m', "<cmd>lua require('telescope.builtin').marks()<cr>")

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-c>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-J>"] = actions.move_selection_next,
        ["<C-K>"] = actions.move_selection_previous,
        ["<C-T>"] = trouble.open_with_trouble,
        ["<C-q>"] = trouble.open_selected_with_trouble,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_up,
      },
      n = {
        ["<C-T>"] = trouble.open_with_trouble
      },
    },
    path_display = {
      shorten = { len = 1, exclude = { -3, -2, -1 } }
    },
    dynamic_preview_title = true,
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "top",
        width = 0.8
      },
    },
    sorting_strategy = "ascending",
    vimgrep_arguments = {
      'rg',
      '--vimgrep',
      '--smart-case',
      '--max-columns',
      '1000'
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}
require('telescope').load_extension('luasnip')
