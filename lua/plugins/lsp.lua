-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP Plugins (server config is in init.lua using native vim.lsp.config)
return {
  -- Mason (Tool installer with custom registry for Roslyn)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    lazy = false, -- Load early so roslyn can find the server
    build = ":MasonUpdate",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- Custom registry for Roslyn
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Rust (rustaceanvim - handles its own LSP)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
  },

  -- C# (roslyn.nvim)
  -- Pre-starts if .sln/.csproj found in project
  {
    "seblyng/roslyn.nvim",
    lazy = false, -- Load immediately
    dependencies = { "mason.nvim" },
    opts = {
      broad_search = true,
      filewatching = true,
    },
    config = function(_, opts)
      require("roslyn").setup(opts)
      
      -- Auto-start Roslyn if we find a C# solution/project
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            local cwd = vim.fn.getcwd()
            local patterns = { "*.sln", "*.slnx", "*.csproj" }
            for _, pattern in ipairs(patterns) do
              local found = vim.fn.glob(cwd .. "/" .. pattern)
              if found ~= "" then
                -- Found C# project, Roslyn will auto-start on first .cs file
                return
              end
            end
          end, 100)
        end,
      })
    end,
  },

  -- Completion (blink.cmp)
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false, -- Load immediately, not lazy
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
        },
        menu = { auto_show = true },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
