-- This function is run last and is a good place to configure
-- augroups/autocommands and custom filetypes. This is just pure lua so
-- anything that doesn't fit in the normal config locations above can go here.
return function()
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
  vim.opt.cpoptions = vim.opt.cpoptions + '$' -- Show $ at end of 'cw' word change
end
