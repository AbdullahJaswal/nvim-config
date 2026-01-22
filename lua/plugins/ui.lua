-- ~/.config/nvim/lua/plugins/ui.lua
return {
  -- Theme: Moonfly
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- Moonfly theme options (set before colorscheme loads)
      vim.g.moonflyItalics = true
      vim.g.moonflyNormalFloat = true
      vim.g.moonflyTerminalColors = true
      vim.g.moonflyTransparent = false
      vim.g.moonflyUndercurls = true
      vim.g.moonflyUnderlineMatchParen = true
    end,
  },

  -- Auto Dark Mode: Detect macOS system theme
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 999,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("moonfly")
      end,
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("moonfly")
      end,
    },
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Status Line (Pretty with LSP info)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- Cached LSP component (only updates when LSP attach/detach)
      local lsp_cache = {}
      vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
        callback = function(args)
          lsp_cache[args.buf] = nil -- Invalidate cache
        end,
      })

      local function lsp_clients()
        local buf = vim.api.nvim_get_current_buf()
        if lsp_cache[buf] then
          return lsp_cache[buf]
        end

        local clients = vim.lsp.get_clients({ bufnr = buf })
        if #clients == 0 then
          lsp_cache[buf] = ""
          return ""
        end

        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end

        local result = " " .. table.concat(names, ", ")
        lsp_cache[buf] = result
        return result
      end

      return {
        options = {
          theme = "moonfly",
          globalstatus = true,
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
            { "filename", path = 1 },
          },
          lualine_x = {
            { lsp_clients },
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },

  -- Indent Guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy", -- Defer loading (visual enhancement only)
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
    },
  },

  -- Snacks: ONLY picker, input, notifier (minimal)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      zen = { enabled = true },
      bigfile = { enabled = true },
      -- DISABLED: dashboard, quickfile, explorer, git
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Text" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Tags" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    },
  },
}
