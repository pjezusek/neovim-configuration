local utils = require('utils.tables')

local default_ripgrep_command_find_files = {
  "rg",
  "--color=never",
  "--files",
  "--hidden",
  "--glob=!*/*/.git/*",
  "--sort=path"
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
  "!**/spec/**",
  "!**/test/**",
  "!**/.git/**"
}

RIPGREP_FIND_FILES_COMMAND = utils.clone_table(default_ripgrep_command_find_files)
for _, value in ipairs(filters) do
  table.insert(RIPGREP_FIND_FILES_COMMAND, '--glob')
  table.insert(RIPGREP_FIND_FILES_COMMAND, value)
end

RIPGREP_LIVE_GREP_GLOB_PATTERN = utils.clone_table(filters)

local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")
local sorters = require('telescope.sorters')

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-c>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = trouble.open,
        ["<C-s>"] = trouble.open,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_up,
      },
      n = {
        ["<C-T>"] = trouble.open
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
    file_sorter = sorters.get_fuzzy_sorter,
  },
  pickers = {
    find_files = {
      find_command = default_ripgrep_command_find_files,
    },
  },
}
require('telescope').load_extension('luasnip')
