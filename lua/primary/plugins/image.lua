return {
  "3rd/image.nvim",
  build = false,
  opts = {
    backend = "kitty",
    processor = "magick_rock", -- or "magick_cli"
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        floating_windows = true, -- Enable floating windows for image rendering in markdown
        filetypes = { "markdown", "vimwiki" }, -- Adjust filetypes as needed
      },
      neorg = {
        enabled = true,
        filetypes = { "norg" },
      },
      typst = {
        enabled = true,
        filetypes = { "typst" },
      },
      html = {
        enabled = false,
      },
      css = {
        enabled = false,
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,  -- Set the maximum height of the image in floating windows
    window_overlap_clear_enabled = true, -- Enable clearing images when windows overlap
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },  -- Ignore certain filetypes for overlap clearing
    editor_only_render_when_focused = false,  -- Control when images are shown based on editor focus
    tmux_show_only_in_active_window = false,  -- Control images in Tmux based on active window
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },  -- Render these image formats when opened
  }
}
