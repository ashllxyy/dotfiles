return {
  {
    "nvim-treesitter/nvim-treesitter",

    branch = "main",

    -- treesitter should not be lazy-loaded
    lazy = false,

    -- update parsers whenever the plugin updates
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").setup({
        -- automatically install missing parsers
        auto_install = true,
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
          -- skip special buffers like: mason, terminals, prompts, buffers, etc.
          local buftype = vim.bo[event.buf].buftype

          if buftype ~= "" then
            return
          end

          -- safely start treesitter for the buffer
          -- pcall prevents errors for unsupported filetypes
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },
}
