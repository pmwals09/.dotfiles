local harpoon = require("harpoon.mark")

local function harpoon_component()
	local total_marks = harpoon.get_length()

	if total_marks == 0 then
		return ""
	end

	local current_mark = "—"

	local mark_idx = harpoon.get_current_index()
	if mark_idx ~= nil then
		current_mark = tostring(mark_idx)
	end

	return string.format("󱡅 %s/%d", current_mark, total_marks)
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', harpoon_component, 'diff', 'diagnostics'},
    lualine_c = {
      {'filename', path = 1},
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
