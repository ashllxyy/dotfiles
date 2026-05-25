return {
  "nvim-mini/mini.files",
  version = false,

  config = function()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    })
    vim.keymap.set("n", "<leader>e", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0))
    end, { desc = "open mini.files" })
  end,
}
