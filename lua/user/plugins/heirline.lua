return function(config)
  -- statusline
  config[1] = {
    hl = { fg = "fg", bg = "bg" },
    astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
    astronvim.status.component.git_branch(),
    astronvim.status.component.file_info { filetype = {}, filename = false, file_modified = false },
    astronvim.status.component.git_diff(),
    astronvim.status.component.diagnostics(),
    astronvim.status.component.fill(),
    astronvim.status.component.cmd_info(),
    astronvim.status.component.fill(),
    astronvim.status.component.lsp(),
    astronvim.status.component.treesitter(),
    astronvim.status.component.nav(),
  }

  -- winbar
  config[2] = {
    static = {
      -- define static disabled table for winbar
      disabled = {
        buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
        filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
      },
    },
    -- set winbar bufnr
    init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    fallthrough = false,
    -- if the buffer matches a disabled buffer, disable winbar
    {
      condition = function(self)
        return vim.opt.diff:get() or astronvim.status.condition.buffer_matches(self.disabled or {})
      end,
      init = function() vim.opt_local.winbar = nil end,
    },
    -- use file_info if winbar is in a buffer that is not active
    astronvim.status.component.file_info {
      condition = function() return not astronvim.status.condition.is_active() end,
      unique_path = {},
      file_icon = { hl = astronvim.status.hl.file_icon "winbar" },
      file_modified = false,
      file_read_only = false,
      hl = astronvim.status.hl.get_attributes("winbarnc", true),
      surround = false,
      update = "BufEnter",
    },
    -- use breadcrumbs if winbar is in a buffer that is active
    astronvim.status.component.breadcrumbs { hl = astronvim.status.hl.get_attributes("winbar", true) },
  }

  -- bufferline
  config[3] = {
    { -- file tree padding
      condition = function(self)
        self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
        return astronvim.status.condition.buffer_matches(
          { filetype = { "neo%-tree", "NvimTree" } },
          vim.api.nvim_win_get_buf(self.winid)
        )
      end,
      provider = function(self) return string.rep(" ", vim.api.nvim_win_get_width(self.winid)) end,
      hl = { bg = "tabline_bg" },
    },
    -- Create a list of components for each buffer using the tabline_file_info component for each buffer
    astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info({ close_button = false })),
    -- Fill the rest of the tabline with empty space
    astronvim.status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color
    -- tab list
    {
      -- if there are more than 1 tab pages, enable this
      condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
      -- Create a list of components for each tab and create a simple component for each
      astronvim.status.heirline.make_tablist {
        provider = astronvim.status.provider.tabnr(),
        -- set the highlight based on the type of tab
        hl = function(self)
          return astronvim.status.hl.get_attributes(astronvim.status.heirline.tab_type(self, "tab"), true)
        end,
      },
      -- button to close current tab
      {
        provider = astronvim.status.provider.close_button { kind = "TabClose", padding = { left = 1, right = 1 } },
        hl = astronvim.status.hl.get_attributes("tab_close", true),
        on_click = { callback = astronvim.close_tab, name = "heirline_tabline_close_tab_callback" },
      },
    },
  }

  return config
end
