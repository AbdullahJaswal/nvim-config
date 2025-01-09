return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "ruff" }, -- Use ruff for linting and auto-fixing
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymap to trigger linting for the current file
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- Auto-fix on save using ruff with --unsafe-fixes option
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = lint_augroup,
      pattern = "*.py",
      callback = function()
        -- Use --unsafe-fixes to allow fixing certain issues
        vim.cmd("!ruff check --fix --unsafe-fixes \"%\"")
      end,
    })
  end,
}
