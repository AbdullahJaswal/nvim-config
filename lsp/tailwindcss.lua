-- LSP config for tailwindcss
return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs", "tailwind.config.mjs", ".git" },
}
