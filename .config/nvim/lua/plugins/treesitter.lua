return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = true },
    ensure_installed = {
      "help",
      "c",
      "javascript",
      "typescript",
      "lua",
      "rust",
      "prisma",
      "vim",
      "yaml",
      "markdown",
      "json",
      "json5",
      "html",
      "toml",
    },
    incremental_selection = { enable = true }
  }
}
