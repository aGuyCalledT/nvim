require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { '', '' },
    section_separators = { '', '' },
    disabled_filetypes = {
      'alpha',
      'NvimTree',
      'Outline',
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        function()
          return '󰣇'
        end,
      },
      { 'mode', separator = {right = '' } }
    },
    lualine_b = {
      {
        'filename',
        file_status = true,
        path = 2,
        shorting_target = 60,
        fmt = function(name)
          if name:find('term://', 1, true) then
            local terminal_path = name:gsub('^term://', '')
            local last_segment = terminal_path:match('.*[/:]([^/:]+)$')
            if not last_segment then
                last_segment = terminal_path
            end
            local final_name = last_segment:match('([^/]+)$')
            if not final_name then
                final_name = last_segment
            end
            final_name = final_name:gsub('%s+$', '')
            return ' ' .. final_name
          else
            local home = vim.fn.expand('~')
            local path_separator = '  '
            local home_icon = ' '
            if name:find(home, 1, true) == 1 then
              name = name:gsub(home, home_icon, 1)
            end
            name = name:gsub('/', path_separator)
            return name
          end
        end,
        separator = {right = ""}
      }
    },
    lualine_c = {
      { 'branch', separator = {right = '' } },
      {
        'diff',
        colored = true,
        diff_color_added = 'LualineDiffAdd',
        diff_color_modified = 'LualineDiffChange',
        diff_color_removed = 'LualineDiffDelete',
        separator = {right = '' }
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = {
          error = ' ', warn = '󰶴 ', info = '󰁦 ', hint = ' '
        },
        colored = true,
        update_always = false,
        separator = {right = '' },
	cond = function ()
		return vim.api.nvim_get_mode().mode ~= 'i'
	end,
      }
    },
    lualine_x = {
      {
        'filetype',
        colored = true,
        fmt = function(filetype)
            local icons = {
                lua = '',
                python = '',
                javascript = '',
                typescript = '󰛦',
                html = '',
                css = '',
                json = '',
                yaml = '',
                markdown = '',
                c = '',
                cpp = '',
                go = '',
                rust = '',
                java = '',
                php = '',
                ruby = '',
                sh = '',
                zsh = '',
                bash = '',
                vim = '',
                gitcommit = '',
                gitrebase = '',
                diff = '',
                dockerfile = '󰡨',
                default = '',
            }
            return (icons[filetype] or icons.default)
        end,
        separator = {}
      },
      {'encoding'},
    },
    lualine_y = {
      {
        'location',
        fmt = function(loc)
          return 'L:C ' .. loc
        end,
        separator = {left = ''}
      },
      { 'progress', separator = { left = ''} },
    },
    lualine_z = {
      {
        function()
          return os.date("󰥔 %H:%M")
        end,
        cond = function() return vim.o.columns > 100 end,
        separator = { left = ''}
      },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'nvim-tree', 'lazy', 'mason' }
}
