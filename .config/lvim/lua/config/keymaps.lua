-- Add any additional keymaps here
-- for LunarVim's leader key
local leader = lvim.builtin.which_key

-- -- Set <leader> key to space
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
-- -- prevent default behavior of space
-- vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- vim.keymap.set("n", "v", "viw", {
--   desc = "Select word"
-- }) -- Select current word
-- Clipboard shortcuts
if vim.g.vscode then
  -- for some reason, vscode doesn't like the decriptions
  vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
  vim.keymap.set({"n", "v"}, "<C-a>", [[:%y+<CR>]])
else
  vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {
    desc = 'Copy to system clipboard',
  })
  vim.keymap.set({"n", "v"}, "<C-a>", [[:%y+<CR>]], {
    desc = 'Copy entire file contents to system clipboard',
  })
end
leader.mappings['C'] = {
  name = " 󰅌 Clipboard",
  y = { [["+y]], " 󰆏 Copy to clipboard" },
  Y = { [["+Y]], " 󰆏 Copy line to clipboard" },
  d = { [["+d]], " 󰆐 Cut to clipboard"},
  D = { [["+D]], " 󰆐 Cut line to clipboard"},
  p = { [["+p]], "  Paste from clipboard"},
  P = { [["+P]], "  Paste from clipboard (before)"}
}


-- -- By default, don't store a copy when deleting lines/words/characters
-- vim.keymap.set({"n","v"}, "x", [["_x]])
-- vim.keymap.set({"n","v"}, "d", [["_d]])
-- vim.keymap.set({"n","v"}, "D", [["_D]])

-- -- Use <leader>[command] in order to store a copy (cut)
-- vim.keymap.set({"n","v"}, "<leader>x", [[""x]], {
--   desc = 'Cut selected text',
-- })
-- vim.keymap.set({"n","v"}, "<leader>d", [[""d]], {
--   desc = 'Cut selected text',
-- })
-- vim.keymap.set({"n","v"}, "<leader>D", [[""D]], {
--   desc = 'Cut current line',
-- })

-- Swap behavior of [] and {}
vim.keymap.set({"n","v"}, "{", "[")
vim.keymap.set({"n","v"}, "[", "{")
vim.keymap.set({"n","v"}, "}", "]")
vim.keymap.set({"n","v"}, "]", "}")

-- Shortcut for nvim-tree
-- vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})  
-- vim.keymap.set("n", "l", edit_or_open,          "Edit Or Open")
-- vim.keymap.set("n", "L", vsplit_preview,        "Vsplit Preview")
-- vim.keymap.set("n", "h", api.tree.close,        "Close")
-- vim.keymap.set("n", "H", api.tree.collapse_all, "Collapse All")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Autoindent shortcuts
vim.keymap.set('v', '<Tab>', '>gv', {
  desc = 'Indent selected lines',
  silent = true
})
vim.keymap.set('v', '<S-Tab>', '<gv', {
  desc = 'Unindent selected lines',
  silent = true
})
vim.keymap.set('n', '<Tab>', '>>', {
  desc = 'Indent current line',
  silent = true
})
vim.keymap.set('n', '<S-Tab>', '<<', {
  desc = 'Unindent current line',
  silent = true
})
vim.keymap.set('n', '<Leader><Tab>', 'gg=G', {
  desc = 'Autoindent entire file',
  silent = true
})

-- Mappings for Panel navigation in LunarVim
leader.mappings["w"] = {
  name = "  Window",
  s = { "<cmd>:split<cr>", "  Horizontal split" },
  v = { "<cmd>:vsplit<cr>", "  Vertical split" },
  h = { "<C-w>h", "  Move left"},
  j = { "<C-w>j", "  Move down"},
  k = { "<C-w>k", "  Move up"},
  l = { "<C-w>l", "  Move right"},
}
leader.mappings["w"]["<left>"] = { ":bprev<cr>", " 󰮳 previous buffer" }
leader.mappings["w"]["<right>"] = { ":bnext<cr>", " 󰮳 next buffer" }
-- Tabs
vim.keymap.set('n', '<C-Left>', '<cmd>bprev<cr>', {
  desc = 'Go to previous buffer'
})
vim.keymap.set('n', '<C-Right>', '<cmd>bnext<cr>', {
  desc = 'Go to next buffer'
})
leader.mappings["<Tab>"] = {
  [[gg=G]],
  "  Autoindent file"
}
leader.mappings["<Leader>"] = {
  "<cmd>WhichKey<cr>",
  "  Show key mappings"
}
leader.mappings['D'] = {
  name = "  Diagnostics",
  -- k = { vim.diagnostic.sh, "  Show line diagnostics" },
  e = { vim.diagnostic.open_float, "  Show floating diagnostics" },
  q = { vim.diagnostic.setloclist, "  Show diagnostics list" },
}
leader.mappings['D']['['] = { vim.diagnostic.goto_prev, "  Previous diagnostic" }
leader.mappings['D'][']'] = { vim.diagnostic.goto_next, "  Next diagnostic" }
leader.mappings['J'] = { ":m +1<cr>", "  Move line down"}
leader.mappings['K'] = { ":m -2<cr>", "  Move line up"}
-- Breakdown:
-- :m - move line command
-- '< - get start of selection block
-- -2 - move one line up
-- gv=gv - reindent and reselect block
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv", {
  desc = 'Move block up'
})
-- '> - get end ov selection block
-- +1 - move one line down
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv", {
  desc = 'Move block down'
})

-- Visual mode mappings
leader.vmappings['F'] = {
  name = " 󰉡 Format",
  j = { ":'<,'>!jq<cr>", "  JSON"}
}

leader.mappings['b']['c'] = { "<cmd>BufferKill<CR>", "Close Buffer"}
leader.mappings['c'] = {}


-- leader.mappings['m']['c'] = { "i- [ ]<ESC>", "Checkbox" }

-- leader.mappings["m"] = {
--   name = " Markdown",
--   ["h"] = {
--     -- Toggle check-boxes.
--     action = function()
--       return require("obsidian").util.toggle_checkbox()
--     end,
--     opts = { buffer = true },
--   },
-- }
