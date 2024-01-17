local harpoon = require("harpoon")

harpoon:setup {
  menu = {
    width = function()
      return math.max(60, math.floor(vim.api.nvim_win_get_width(0) * 0.8))
    end
  }
}

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

for i=1,4 do
  vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end)
end
