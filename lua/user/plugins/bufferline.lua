-- Option overrides for the buffer list across the top of the OS window

return {
  options = {
    -- Indicate code error in the buffer tab
    diagnostics = "nvim_lsp",

    -- Don't show ✕ close icons... I don't use the mouse
    show_buffer_close_icons = false,
    show_close_icon = false,

    -- Nicer "tab" separator
    separator_style = "slant",

    -- Show buffer number after the filename/info
    -- numbers = "buffer_id",
  }
}
