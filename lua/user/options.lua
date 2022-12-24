return {
  -- set vim options here (vim.<first_key>.<second_key> = value)
  opt = {
    relativenumber = true, -- relative line numbering
    number = true, -- show line numbers
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = true, -- wrap long lines

    clipboard = "unnamed", -- use MacOS clipboard when yanking
    expandtab = true,
    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = " ", extends = "⟩", precedes = "⟨", trail = "·", eol = "﬋" },
    showbreak = "﬌ ",
    undofile = false, -- persistent undo (after quit)
  },

  g = {
    mapleader = " ", -- use spacebar as leader
    autoformat_enabled = true, -- auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- completion at start
    autopairs_enabled = true, -- autopairs at start
    diagnostics_enabled = true, -- diagnostics at start
    status_diagnostics_enabled = true, -- diagnostics in statusline
    icons_enabled = true, -- icons in the UI (disable if no nerd font is available)
    ui_notifications_enabled = true, -- notifications when toggling UI elements
    heirline_bufferline = true,

    gh_color = "soft", -- slightly less dark background for vim-github-dark theme
  },
}
