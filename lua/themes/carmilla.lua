-- ~/.config/nvim/lua/themes/carmilla.lua
---
---Highly inspired from the classic dracula theme, i made this theme with a few personal tweaks.
---
---@type Base46Table
local M = {}

-- Classic Dracula palette (from draculatheme.com)
local BG         = "#282a36"
local FG         = "#f8f8f2"
local COMMENT    = "#6272a4"
local SELECTION  = "#44475a"
local RED        = "#ff5555"
local ORANGE     = "#ffb86c"
local YELLOW     = "#f1fa8c"
local GREEN      = "#50fa7b"
local PURPLE     = "#bd93f9"
local PINK       = "#ff79c6"
local CYAN       = "#8be9fd"
-- Added Colors for my taste
local LIME        = "#b6f36c"
local PALE_ORANGE = "#FFCC5C"

-- UI colors (statusline, tabs, menus, splits)
M.base_30 = {
  white = FG,
  black = BG,                  -- editor background
  darker_black = "#1f2030",    -- a touch darker than BG
  black2 = "#2d2f3b",          -- slight raise from BG
  one_bg = "#2e3040",          -- subtle panel bg
  one_bg2 = "#34364a",
  one_bg3 = "#3a3d52",

  grey = SELECTION,            -- classic dracula selection/split
  grey_fg = "#585c76",         -- derived from comment/selection
  grey_fg2 = "#6b7090",
  light_grey = "#7c81a3",

  -- Accents mapped to dracula hues
  red = RED,
  baby_pink = "#ff92df",
  pink = PINK,
  purple = PURPLE,
  dark_purple = "#a37cf6",
  blue = CYAN,                 -- Dracula has no true blue; use cyan
  nord_blue = "#7bd2e6",       -- kept close to cyan
  cyan = CYAN,
  teal = "#7ad8e0",

  green = GREEN,
  vibrant_green = "#69ff94",
  yellow = YELLOW,
  sun = PALE_ORANGE,
  orange = ORANGE,

  -- UI specifics
  statusline_bg = "#232534",   -- darker statusline that matches BG
  lightbg = "#2e3040",
  pmenu_bg = PURPLE,           -- popup menu highlight
  folder_bg = CYAN,
  line = SELECTION,            -- split lines
}

-- Base16 slots (syntax core)
M.base_16 = {
  base00 = BG,          -- bg
  base01 = "#2d2f3b",
  base02 = "#2e3040",
  base03 = SELECTION,   -- selection/comments base
  base04 = "#cfcfe3",
  base05 = FG,          -- fg
  base06 = "#ffffff",
  base07 = FG,

  base08 = RED,         -- variables, errors
  base09 = ORANGE,      -- numbers, punctuation (variant)
  base0A = YELLOW,      -- strings
  base0B = GREEN,       -- functions
  base0C = CYAN,        -- classes/types (variant)
  base0D = CYAN,        -- "blue" slot -> cyan in Dracula
  base0E = PURPLE,      -- keywords
  base0F = PINK,        -- special
}

-- Extra polish to match the classic look/contrast
M.polish_hl = {
  defaults = {
    Normal = { fg = FG, bg = BG },
    Comment = { fg = COMMENT, italic = true },
    CursorLine = { bg = "#2e3040" },
    CursorColumn = { bg = "#2e3040" },
    Visual = { bg = SELECTION },
    MatchParen = { fg = FG, bg = SELECTION, bold = true },

    LineNr = { fg = "#585c76" },
    CursorLineNr = { fg = FG, bold = true },

    Pmenu = { bg = "#232534", fg = FG },
    PmenuSel = { bg = SELECTION, fg = FG, bold = true },
    PmenuSbar = { bg = "#2b2d3b" },
    PmenuThumb = { bg = "#3a3d52" },

    Search = { bg = ORANGE, fg = BG },
    IncSearch = { bg = PINK, fg = BG },

    Directory = { fg = CYAN },
    Title = { fg = PURPLE, bold = true },
  },

  -- Treesitter groups mapped to classic Dracula semantics
  treesitter = {
    ["@comment"] = { fg = COMMENT, italic = true },
    ["@string"] = { fg = FG },
    ["@string.escape"] = { fg = PURPLE, bold = true },
    ["@character"] = { fg = YELLOW },
    ["@number"] = { fg = PALE_ORANGE },
    ["@boolean"] = { fg = PINK },
    ["@constant"] = { fg = YELLOW},
    ["@constant.builtin"] = { fg = ORANGE },
    ["@variable"] = { fg = FG },
    ["@variable.builtin"] = { fg = PINK, italic = true },
    ["@property"] = { fg = CYAN },
    ["@field"] = { fg = CYAN },
    ["@type"] = { fg = PURPLE },
    ["@type.builtin"] = { fg = PURPLE, italic = true },
    ["@keyword"] = { fg = PINK, italic = true },
    ["@keyword.function"] = { fg = PINK, italic = true },
    ["@function"] = { fg = GREEN },
    ["@function.builtin"] = { fg = GREEN, italic = true },
    ["@operator"] = { fg = PURPLE },
    ["@punctuation.delimiter"] = { fg = "#cfcfe3" },
  },

  -- Common plugin groups
  nvimtree = {
    NvimTreeNormal = { bg = "#242637" },
    NvimTreeRootFolder = { fg = CYAN, bold = true },
    NvimTreeOpenedFolderName = { fg = CYAN, bold = true },
  },
  telescope = {
    TelescopeNormal = { bg = "#232534", fg = FG },
    TelescopeBorder = { fg = "#585c76", bg = "#232534" },
    TelescopeSelection = { bg = SELECTION },
    TelescopeMatching = { fg = PINK, bold = true },
  },
  whichkey = {
    WhichKey = { fg = PURPLE },
    WhichKeyDesc = { fg = CYAN },
  },
  cmp = {
    CmpItemAbbrMatch = { fg = CYAN, bold = true },
    CmpItemKindFunction = { fg = GREEN },
    CmpItemKindVariable = { fg = YELLOW },
  },
}

M.type = "dark"

-- Respect user overrides from chadrc.lua (hl_override/changed_themes)
M = require("base46").override_theme(M, "carmilla")
return M
