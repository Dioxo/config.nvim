return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          { 'copilot', show_colors = true },
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'AndreM222/copilot-lualine' },
}
