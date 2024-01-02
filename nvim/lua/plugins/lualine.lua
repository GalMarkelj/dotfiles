-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  background = '#222436',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#333333',
  green = '#6cc644',
}

local my_custom_theme = {
  normal = {
    a = { fg = colors.background, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.background },
  },
  insert = { a = { fg = colors.background, bg = colors.blue } },
  visual = { a = { fg = colors.background, bg = colors.cyan } },
  replace = { a = { fg = colors.background, bg = colors.red } },
  command = { a = { fg = colors.background, bg = colors.green } },
  inactive = {
    a = { fg = colors.white, bg = colors.background },
    b = { fg = colors.white, bg = colors.background },
    c = { fg = colors.background, bg = colors.background },
  },
}

local Util = require("lazyvim.util")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",

  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,

  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = my_custom_theme,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch" },
        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 2, right = 1 }, separator = { right = "" } },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
