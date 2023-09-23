local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup {
  menu = {
    width = function()
      return math.max(60, math.floor(vim.api.nvim_win_get_width(0) * 0.8))
    end
  }
}

vim.keymap.set("n", "<leader>ha", function() mark.add_file() end)
vim.keymap.set("n", "<leader>ho", function() ui.toggle_quick_menu() end)

for i=1,4 do
  vim.keymap.set("n", "<leader>h" .. i, function() ui.nav_file(i) end)
end
