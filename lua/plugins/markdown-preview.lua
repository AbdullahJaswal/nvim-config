-- markdown-preview.nvim configuration
-- Add this to your lazy.nvim plugin specs

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle" },
  },
  config = function()
    vim.g.mkdp_auto_start = 0 -- Don't auto-open preview when entering markdown buffer
    vim.g.mkdp_auto_close = 1 -- Auto-close preview when leaving markdown buffer
    vim.g.mkdp_refresh_slow = 0 -- Refresh on save or leave insert mode
    vim.g.mkdp_command_for_global = 0 -- Only available for markdown files
    vim.g.mkdp_open_to_the_world = 0 -- Only localhost can access preview
    vim.g.mkdp_browser = "" -- Use default browser
    vim.g.mkdp_echo_preview_url = 1 -- Echo the preview URL in command line
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {},
    }
    vim.g.mkdp_theme = "dark" -- "dark" or "light"
  end,
}
