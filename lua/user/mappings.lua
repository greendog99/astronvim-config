-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

    -- Search highlight groups
    ["<space>sg"] = { "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },

    -- Resize splits with ALT+hjkl since AstroNvim's defaults conflict with MacOS
    ["˚"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["∆"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    ["˙"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["¬"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

    -- Zen mode
    ["<leader>Zf"] = { "<cmd>TZFocus<cr>", desc = "True-Zen Focus" },
    ["<leader>Za"] = { "<cmd>TZAtaraxis<cr>", desc = "True-Zen Ataraxis" },

    -- Undo some AstroNvim mappings
    ["<C-q>"] = false,
    ["<C-s>"] = false,
  },
  v = {
    ["<leader>Zn"] = { ":'<,'>TZNarrow<cr>", desc = "True-Zen Narrow" },
  },
  t = {
  },
}
