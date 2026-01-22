-- ~/.config/nvim/lua/plugins/git.lua
-- Git integration plugins
return {
  -- Gitsigns: Inline git diff signs, blame, hunk navigation
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost" }, -- Load after file is displayed, not before
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged_enable = true,
      current_line_blame = false, -- Toggle with <leader>gb
      current_line_blame_opts = {
        delay = 300,
      },
      -- Performance optimizations
      watch_gitdir = {
        interval = 1000, -- Check git changes every 1s instead of constantly
        follow_files = true,
      },
      update_debounce = 200, -- Debounce updates by 200ms
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation between hunks
        -- ] + h → Next git hunk (change)
        map("n", "]h", gs.next_hunk, "Next Hunk")
        -- [ + h → Previous git hunk (change)
        map("n", "[h", gs.prev_hunk, "Previous Hunk")

        -- Actions
        -- Space + g + s → Stage current hunk
        map("n", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
        -- Space + g + r → Reset current hunk
        map("n", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
        -- Space + g + S → Stage entire buffer
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        -- Space + g + u → Undo stage hunk
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        -- Space + g + R → Reset entire buffer
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        -- Space + g + p → Preview hunk inline
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        -- Space + g + b → Toggle blame line
        map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle Blame")
        -- Space + g + d → Diff this file
        map("n", "<leader>gd", gs.diffthis, "Diff This")
      end,
    },
  },
}
