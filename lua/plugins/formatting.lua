-- ~/.config/nvim/lua/plugins/formatting.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Only load when saving (already optimal)
  cmd = { "ConformInfo" },
  lazy = true, -- Ensure it's lazy loaded
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true }) end,
      desc = "Format Buffer",
    },
  },
  opts = {
    formatters = {
      ["biome-check"] = {
        require_cwd = true,
        condition = function(self, ctx)
          -- Only run Biome if biome.json exists
          return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      -- Run Biome first (if config found), otherwise run Prettier
      javascript = { "biome-check", "prettier", stop_after_first = true },
      typescript = { "biome-check", "prettier", stop_after_first = true },
      typescriptreact = { "biome-check", "prettier", stop_after_first = true },
      javascriptreact = { "biome-check", "prettier", stop_after_first = true },
      json = { "biome-check", "prettier", stop_after_first = true },
      yaml = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      go = { "gofmt", "goimports" },
      rust = { "rustfmt" },
      cs = { "csharpier", lsp_format = "fallback" }, -- Use LSP if csharpier unavailable
      ["*"] = { "trim_whitespace" },
    },
    format_on_save = function(bufnr)
      -- Increase timeout for C# files (csharpier is slow)
      local timeout = 500
      if vim.bo[bufnr].filetype == "cs" then
        timeout = 3000
      end
      return {
        timeout_ms = timeout,
        lsp_fallback = true,
      }
    end,
  },
}
