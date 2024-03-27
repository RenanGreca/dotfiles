local function config()
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"
  local builtin = require "telescope.builtin"

  vim.keymap.set('n', '<Leader>f', builtin.find_files, opts('Telescope', 'Find files'))

end


return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- probably only works with make, maybe disable in windows
        -- 'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = config
}
