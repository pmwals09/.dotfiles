local t = require("trouble")

vim.keymap.set("n", "<leader>tt", function() t.toggle() end)
vim.keymap.set("n", "<leader>tq", function() t.toggle("quickfix") end)
vim.keymap.set("n", "<leader>td", function() t.toggle("document_diagnostics") end)
