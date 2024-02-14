local function apply_colors()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#092135" })
  vim.api.nvim_set_hl(0, "VisualActive", { bg = "#1d3b88" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1f4429" })
end
-- Color scheme
return {
  -- {
  --   "lunarvim/synthwave84.nvim",
  --   lazy = true,
  -- },
  -- {
  --   "oxfist/night-owl.nvim",
  --   lazy = true, -- make sure we load this during startup if it is your main colorscheme
  --   -- priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --    apply_colors()
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('kanagawa-wave')
      apply_colors()
    end
  },
}
