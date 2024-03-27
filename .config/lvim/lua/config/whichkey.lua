local whichkey = lvim.builtin.which_key
local leader = whichkey.mappings

leader.q = {}
leader.e[2] = " 󱂪 Explorer"
leader.g.name = " 󰊢 Git"
leader.f[2] = " 󰱼 Find files"
leader.p.name = "  Plugins"
leader.L.name = "  LunarVim"
leader.d.name = "  Debug"
leader[';'][2] = " 󰨝 Dashboard"
leader['/'][2] = " 󰅺 Comment toggle"
leader['c'][2] = "  Close buffer"
leader['h'][2] = " 󰸱 No highlight"
leader['l'][2] = "  LSP"
leader.T.name = "  Treesitter"
leader.s.name = "  Search"
leader.b.name = "  Buffers"

whichkey.setup.icons.separator = ""
whichkey.setup.icons.group = ""

-- whichkey.icons.group = ""
-- whichkey.vmap
