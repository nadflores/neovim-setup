return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Disable inline error messages
			vim.diagnostic.config({
				virtual_text = false,
				float = {
					border = "single",
				},
			})

			-- Add border to floating window
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

			-- Set highlight for floating window
			local set_hl_for_floating_window = function()
				vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			end

			set_hl_for_floating_window()

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				desc = "Avoid overwritten by loading color schemes later",
				callback = set_hl_for_floating_window,
			})

			local on_attach = function(client, bufnr)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
				vim.keymap.set("n", "gf", vim.lsp.buf.code_action, { buffer = bufnr })
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local signs = { Error = "✖", Warn = "", Hint = "󰠠", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Configure LSP servers
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
