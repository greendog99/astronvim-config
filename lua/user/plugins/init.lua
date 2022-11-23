return {
  -- Disable default plugins:
  -- ["goolord/alpha-nvim"] = { disable = true },

  -- color schemes:
  -- ["EdenEast/nightfox.nvim"] = {},
  -- ["tomasiser/vim-code-dark"] = {},
  ["RRethy/nvim-base16"] = {},
  ["wojciechkepka/vim-github-dark"] = {},

  -- other plugins:
  ["yuttie/comfortable-motion.vim"] = {}, -- smooth scrolling
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
    config = function()
      require("nvim-lastplace").setup()
    end,
  },

  -- Distraction-free coding
  ["folke/zen-mode.nvim"] = {
    -- cmd = "ZenMode",
    -- module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },
}
