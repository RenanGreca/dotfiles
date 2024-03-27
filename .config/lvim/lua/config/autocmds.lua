-- Add any additional autocmds here

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local format_sync_group = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_group
})

-- local filetype_detect = vim.api.nvim_create_augroup('filetypedetect', {clear = true})
-- vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
--   callback = function()
--     if (vim.fn.expand('%:e') == 'html' and vim.fn.search("{{") ~= 0) then
--       vim.cmd('setfiletype gohtmltmpl')
--     end
--   end,
--   group = filetype_detect,
--   pattern = '*.html'
-- })
