---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  changed_themes = {
    ayu_dark = {
      -- base_30 = {
      --   -- black = "#2C2E34",
      --   grey = "#2C2E34",
      -- },
      base_16 = {
        -- black = "#2C2E34",
        -- base00 = "#2C2E34",
      },
    },
  },

  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
  },


}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
