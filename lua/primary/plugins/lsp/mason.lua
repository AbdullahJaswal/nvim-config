return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "dockerls", -- Dockerfile LSP
        "docker_compose_language_service", -- Docker Compose LSP
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- Prettier formatter
        "stylua", -- Lua formatter
        "isort", -- Python formatter
        "black", -- Python formatter
        "pylint", -- Python linter
        "eslint_d", -- JS linter
        "clang-format", -- C/C++ formatter
        "sql-formatter", -- SQL formatter
        "sqlfluff", -- SQL linter and formatter
        "hadolint", -- Dockerfile linter
        "yamllint", -- YAML linter
        "svelte-language-server", -- Svelte Language Server
        "eslint", -- For linting Svelte files via ESLint
      },
    })
  end,
}
