-- Gruvbox
-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({})
--     vim.cmd([[
--       colorscheme gruvbox
--       hi CocUnusedHighlight cterm=underline gui=underline guifg=#6B6860
--     ]])
--   end,
-- }

-- Tokyonight
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[
      colorscheme tokyonight
    ]])
	end,
}

-- Catppuccin
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd([[
--       colorscheme catppuccin
--     ]])
--   end,
-- }
