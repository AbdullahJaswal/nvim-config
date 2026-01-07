-- ~/.config/nvim/lua/plugins/linting.lua
-- Linting with nvim-lint
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "ruff" },
      dockerfile = { "hadolint" },
    }

    -- Auto-trigger linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(buf)
        
        -- Check if Biome config exists
        local biome_config = vim.fs.find({ "biome.json", "biome.jsonc" }, { path = name, upward = true })[1]
        
        if biome_config then
          -- If Biome exists, don't run ESLint (Biome handles linting via LSP)
          return
        end

        -- Otherwise run configured linters (e.g. eslint_d)
        lint.try_lint()
      end,
    })
  end,
}
