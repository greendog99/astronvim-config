return {
  -- Disable default plugins:
  -- ["goolord/alpha-nvim"] = { disable = true },

  -- color schemes:
  -- ["EdenEast/nightfox.nvim"] = {},
  -- ["tomasiser/vim-code-dark"] = {},
  ["RRethy/nvim-base16"] = {},
  ["wojciechkepka/vim-github-dark"] = {},

  -- other plugins:
  -- ["yuttie/comfortable-motion.vim"] = {}, -- smooth scrolling
  ["fladson/vim-kitty"] = {}, -- kitty config syntax highlighting

  -- Edit surround characters like "'({[]})'"
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Jump to any place in viewport quickly
  ["ggandor/leap.nvim"] = {
    config = function()
      require("leap").add_default_mappings()
    end
  },

  -- Reopen files at last edit position
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function() require("nvim-lastplace").setup() end,
  },

  -- Distraction-free coding
  ["Pocco81/true-zen.nvim"] = {
    config = function() require("user.plugins.true-zen") end,
  },

  -- Telescope clipboard (yank) history
  -- ["AckslD/nvim-neoclip.lua"] = {
  --   after = "telescope.nvim",
  --   config = function() require("telescope").load_extension "neoclip" end,
  -- }
}
