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
      -- Open neo-tree immediately when opening a directory (no flicker)
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
        callback = function()
          local f = vim.fn.expand("%:p")
          if vim.fn.isdirectory(f) == 1 then
            vim.cmd("bwipeout") -- Delete the directory buffer
            require("neo-tree.command").execute({ toggle = false, dir = f })
            return true -- Remove this autocmd after first run
          end
        end,
      })
    end,
    opts = {
      close_if_last_window = false,
      filesystem = {
        hijack_netrw_behavior = "disabled", -- We handle it ourselves
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 35,
        mappings = {
          ["<space>"] = "none",
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
        highlight = { enable = true },
        indent = { enable = true },
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
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
