local lib = require('lib')


local default_ripgrep_command_find_files = {
  "rg",
  "--color",
  "never",
  "--files",
  "--hidden",
  "--glob",
  "!**/.git/*"
}
local default_ripgrep_command_live_grep = {
  "rg",
  "--vimgrep",
  "--hidden",
  "--smart-case",
  "--max-columns",
  "1000",
  "--glob",
  "!**/.git/*"
}

local filters = {
  "!spec/**/*",
  "!**/*_spec.rb"
}

RIPGREP_FIND_FILES_COMMAND = default_ripgrep_command_find_files
for _, value in ipairs(filters) do
  table.insert(RIPGREP_FIND_FILES_COMMAND, '--glob')
  table.insert(RIPGREP_FIND_FILES_COMMAND, value)
end

RIPGREP_LIVE_GREP_GLOB_PATTERN = filters

lib.nmap(
  '<C-P>',
  "<cmd>lua require('telescope.builtin').find_files({ find_command = RIPGREP_FIND_FILES_COMMAND })<cr>"
)
lib.nmap('<leader><C-P>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
lib.nmap('<C-S>', "<cmd>lua require('telescope.builtin').live_grep({ glob_pattern = RIPGREP_LIVE_GREP_GLOB_PATTERN })<cr>")
lib.nmap('<leader><C-S>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
lib.nmap('<C-E>', "<cmd>lua require('telescope.builtin').buffers()<cr>")
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
    vimgrep_arguments = default_ripgrep_command_live_grep,
  },
  pickers = {
    find_files = {
      find_command = default_ripgrep_command_find_files,
    },
  },
}
require('telescope').load_extension('luasnip')
