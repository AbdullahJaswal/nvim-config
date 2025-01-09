return {
  "RRethy/vim-illuminate",  -- Plugin name
  config = function()
    -- Configure vim-illuminate
    require("illuminate").configure({
      providers = { 'lsp', 'treesitter', 'regex' },
      delay = 100,
      filetype_overrides = {},
      filetypes_denylist = { 'dirbuf', 'dirvish', 'fugitive' },
      filetypes_allowlist = {},
      modes_denylist = {},
      modes_allowlist = {},
      providers_regex_syntax_denylist = {},
      providers_regex_syntax_allowlist = {},
      under_cursor = true,  -- Enable highlighting under the cursor
      large_file_cutoff = nil,
      large_file_overrides = nil,
      min_count_to_highlight = 1,
      should_enable = function(bufnr) return true end,
      case_insensitive_regex = false,
    })

    -- Set the highlight for illuminated text to include a yellow underline
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true, sp = "#FFFF00" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true, sp = "#FFFF00" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true, sp = "#FFFF00" })
  end,
}
