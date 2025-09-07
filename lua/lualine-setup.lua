require('lualine').setup{
      options = {
        icons_enabled = false,
        theme = {
          normal = {
            a = {bg = '#34e2e2', fg = '#092d32', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          },
          insert = {
            a = {bg = '#80a0ff', fg = '#092d32', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          },
          visual = {
            a = {bg = '#ffa500', fg = '#092d32', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          },
          replace = {
            a = {bg = '#00ff00', fg = '#092d32', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          },
          command = {
            a = {bg = '#18407e', fg = '#34e2e2', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          },
          inactive = {
            a = {bg = '#a89984', fg = '#3c3836', gui = 'bold'},
            b = {bg = '#104c53', fg = '#34e2e2'},
            c = {bg = '#092d32', fg = '#34e2e2'},
          }
        },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
           winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode', Window},
        lualine_b = {'diagnostics', 'filename'},
        lualine_c = {'buffers', },
        lualine_x = {'filetype'},
        lualine_y = {GetLiveWords, GetWords},
        lualine_z = {'progress'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
