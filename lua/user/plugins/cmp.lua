-- Option overrides for cmp autocompletion

local cmp = require "cmp"
local luasnip = require "luasnip"

return {
  view = {
    entries = "custom"
  },
  mapping = {
    -- ["<Tab>"] = cmp.config.disable, -- disable <Tab> autocomplete

    -- Use <Tab> to jump between luasnip fields, but not to autocomplete.
    -- Instead, use ↑↓jk to select a snippet, then Tab to jump fields.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}
