-- Override default lvim setting to show preview upon <leader>f
lvim.builtin.which_key.mappings['f'] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = true}
  end,
  " 󰈞 Find files"
}
lvim.builtin.telescope.theme = "center"
