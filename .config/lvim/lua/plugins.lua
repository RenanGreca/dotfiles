lvim.plugins = {
  {
    "arnamak/stay-centered.nvim",
    config = function()
      require('stay-centered').setup()
    end,
  },
  "prabirshrestha/vim-lsp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  require('plugin.wilder'),
  -- require('plugin.copilot'),
  require('plugin.neotest'),
  require('plugin.obsidian'),
  require('plugin.markdown'),

  require('plugin.rust'),
  require('plugin.go'),
  -- require('plugin.catppuccin'),
  require('plugin.pkl'),

}

require('plugin.lsp')
-- require('plugin.wilder')


