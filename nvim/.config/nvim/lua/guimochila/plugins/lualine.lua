return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    require('lualine').setup({
      options = {
        theme = 'material',
      },
      sections = {
        lualine_c = {
          {
            "filename",
            symbols = {
              modified = "●",
            },
          },
        },
      },
    })
  end
}
