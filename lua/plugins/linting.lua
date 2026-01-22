-- ~/.config/nvim/lua/plugins/linting.lua
-- Linting with nvim-lint
return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost" }, -- Only load when you save a file (deferred loading)
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

    -- Auto-trigger linting (optimized: only on save, not on every cursor move)
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
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

    -- Optional: Lint on entering buffer (less aggressive than before)
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = lint_augroup,
      callback = function()
        -- Only lint if buffer wasn't recently linted
        local buf = vim.api.nvim_get_current_buf()
        local last_lint = vim.b[buf].last_lint_time or 0
        local current_time = vim.loop.now()

        if current_time - last_lint > 5000 then -- 5 second debounce
          local name = vim.api.nvim_buf_get_name(buf)
          local biome_config = vim.fs.find({ "biome.json", "biome.jsonc" }, { path = name, upward = true })[1]

          if not biome_config then
            lint.try_lint()
            vim.b[buf].last_lint_time = current_time
          end
        end
      end,
    })
  end,
}
