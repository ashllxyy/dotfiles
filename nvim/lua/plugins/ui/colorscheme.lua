return {
  {
    "webhooked/kanso.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("kanso").setup({
        theme = "zen",
        transparent = true,
      })
      vim.cmd.colorscheme("kanso")
    end,
  },
}
