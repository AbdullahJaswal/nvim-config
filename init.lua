-- ~/.config/nvim/init.lua
-- Neovim 2026 Configuration
require("config.options")
require("config.keymaps")
require("config.lazy")

-- ============================================================================
-- NATIVE LSP CONFIG (Neovim 0.11+)
-- ============================================================================

-- Default config for all servers
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- Lua
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = { Lua = { telemetry = { enable = false }, workspace = { checkThirdParty = false } } },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- Go
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = { gopls = { gofumpt = true, staticcheck = true } },
})

-- Python
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
})

vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
})

-- HTML/CSS
vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
})

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
})

vim.lsp.config("tailwindcss", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "javascriptreact" },
  -- Tailwind v3 config files + v4 (no config, uses package.json/postcss)
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs", "tailwind.config.mjs", "postcss.config.js", "postcss.config.ts", "package.json" },
})

-- JSON/YAML
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
})

vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
})

-- Docker/Bash
vim.lsp.config("dockerls", {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
})

vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
})

-- Biome (Formatter/Linter)
vim.lsp.config("biome", {
  cmd = { "biome", "lsp-proxy" },
  filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact.svelte", "svelte", "vue", "css" },
  root_markers = { "biome.json", "biome.jsonc" },
})

-- Enable all servers
vim.lsp.enable({
  "lua_ls", "ts_ls", "gopls", "pyright", "ruff",
  "html", "cssls", "tailwindcss", "jsonls", "yamlls",
  "dockerls", "bashls", "biome",
})

-- ============================================================================
-- LSP KEYMAPS
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(k, f, d) vim.keymap.set("n", k, f, { buffer = args.buf, desc = d }) end
    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("gr", vim.lsp.buf.references, "Find References")
    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
    map("K", vim.lsp.buf.hover, "Hover Doc")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>cs", vim.lsp.buf.signature_help, "Signature Help")
  end,
})

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded" },
})

-- ============================================================================
-- SMART :q BEHAVIOR
-- ============================================================================
vim.keymap.set("ca", "q", function()
  local wins = vim.fn.winnr("$")
  local bufs = #vim.fn.getbufinfo({ buflisted = 1 })
  if wins > 1 then
    return "close"
  elseif bufs > 1 then
    return "bd"
  else
    return "q"
  end
end, { expr = true })
