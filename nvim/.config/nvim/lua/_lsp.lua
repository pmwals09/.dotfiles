-- ===
-- LSP
-- ===

vim.lsp.start({
	name = "go-server",
	cmd = { "go-server" },
	root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
})

require("neodev").setup()

-- === MASON/LSP ===

require("mason").setup({
	PATH = "prepend",
	ui = {
		border = "rounded",
	},
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"omnisharp",
		"cssls",
		"eslint",
		"emmet_ls",
		"gopls",
		"html",
		"jsonls",
		"tsserver",
		"jqls",
		"ltex",
		"lua_ls",
		"sqlls",
		"tailwindcss",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
	vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>ltd", require("telescope.builtin").lsp_type_definitions, bufopts)
	vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, bufopts)
	vim.keymap.set("n", "<leader>lqf", vim.diagnostic.setloclist, bufopts)
	vim.keymap.set("n", "<leader>lds", require("telescope.builtin").lsp_document_symbols, bufopts)
	vim.keymap.set("n", "<leader>lr", "<Cmd>LspRestart<CR>", bufopts)
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		-- underline = true,
		update_in_insert = true,
		severity_sort = false,
	})
end

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	border = "rounded",
	sources = {
		-- formatting
		formatting.prettier,
		formatting.stylua,

		-- diagnostics
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
			end,
		}),

		-- code actions
		code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
			end,
		}),
	},
})

-- ====
-- Misc.
-- ====

vim.cmd([[
  augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
  augroup END
]])

-- ==========
-- Completion
-- ==========

local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
---@diagnostic disable-next-line: missing-fields
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "cody" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
		}),
	},
})

return {
	on_attach = on_attach,
}
