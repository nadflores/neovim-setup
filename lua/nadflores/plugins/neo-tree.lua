return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- OR setup with some options
    require("neo-tree").setup({
      window = {
        width = 35,
      }
    })
    vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>')
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}
