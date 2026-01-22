-- ~/.config/nvim/lua/plugins/editor.lua
return {
  -- File Tree (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
      { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal in Explorer" },
    },
    init = function()
      -- Auto-open Neo-tree on startup (deferred to not block file loading)
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
        callback = function()
          vim.defer_fn(function()
            -- Only auto-open if no file arguments or opening a directory
            local args = vim.fn.argv()
            if #args == 0 or vim.fn.isdirectory(args[1]) == 1 then
              -- Opening nvim without file or with directory
              require("neo-tree.command").execute({ action = "show" })
            else
              -- Opening with a file - show tree but don't focus it
              require("neo-tree.command").execute({ action = "show" })
              -- Return focus to the file
              vim.cmd("wincmd p")
            end
          end, 100) -- 100ms delay to allow file to render first
        end,
      })

      -- Handle opening a directory directly (keep existing behavior)
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
        callback = function()
          local f = vim.fn.expand("%:p")
          if vim.fn.isdirectory(f) == 1 then
            vim.cmd("bwipeout") -- Delete the directory buffer
            require("neo-tree.command").execute({ toggle = false, dir = f })
            return true
          end
        end,
      })
    end,
    opts = {
      close_if_last_window = false,
      -- PERFORMANCE: Async operations (keep for performance)
      async_directory_scan = "always",
      use_popups_for_input = false,
      -- Re-enable visual features (you wanted these back)
      enable_git_status = true,
      enable_diagnostics = true,
      enable_modified_markers = true,
      filesystem = {
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = false }, -- Keep disabled for performance
        use_libuv_file_watcher = false, -- Keep disabled for performance
        async_directory_scan = "always", -- Keep async for performance
        group_empty_dirs = false, -- Keep disabled for performance
      },
      window = {
        position = "left",
        width = 35,
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
        indent = {
          with_expanders = true, -- Re-enable for better visual structure
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
      -- PERFORMANCE: Keep async tree building and item limit
      renderer = {
        max_items = 1000,
        async_file_tree_builder = true,
      },
      -- Enable cursorline and optimize buffer settings
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- Re-enable cursorline for current row highlighting
            vim.cmd("setlocal cursorline")
            vim.cmd("setlocal nocursorcolumn")
            -- Keep regular numbers instead of relative (small performance win)
            vim.cmd("setlocal norelativenumber number")
          end,
        },
      },
    },
  },

  -- Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "tsx",
          "python", "rust", "go", "c_sharp",
          "bash", "markdown", "markdown_inline",
          "json", "yaml", "toml",
          "dockerfile", "css", "html", "sql",
        },
        highlight = {
          enable = true,
          -- Disable for very large files (performance optimization)
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false, -- Disable for performance
        },
        indent = {
          enable = true,
          -- Some languages have buggy indent, disable if needed
          disable = {},
        },
        -- Incremental selection and other modules disabled for faster loading
        incremental_selection = { enable = false },
        textobjects = { enable = false },
      })
    end,
  },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true },
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 200,
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>c", group = "Code" },
        { "<leader>r", group = "Refactor" },
      },
    },
  },

  -- LazyDev
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy", -- Defer loading until after startup
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
