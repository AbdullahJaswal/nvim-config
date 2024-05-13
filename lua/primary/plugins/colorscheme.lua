return {
  {
      "bartekprtc/gruv-vsassist.nvim",
      lazy = false,
      priority = 1000,
      config = function(_, opts)
          vim.opt.termguicolors = true

          vim.cmd [[colorscheme gruv-vsassist]]

          -- Applying color overrides
          require('gruv-vsassist').setup({
            color_overrides = {
                vscBack = '#101010',
            },
          })

          -- Set background transparency
          -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
          -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
      end,
  },
  -- {
  --     "dasupradyumna/midnight.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme midnight]]

  --         -- Set background transparency
  --         vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function(_, opts)
  --       vim.opt.termguicolors = true

  --       vim.cmd [[colorscheme tokyonight-night]]

  --       -- Set background transparency
  --       -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --       -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --   end,
  -- },
  -- {
  --     "notken12/base46-colors",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme radium]]

  --         -- Set background transparency
  --         vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "zootedb0t/citruszest.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme citruszest]]

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "shaunsingh/moonlight.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme moonlight]]

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "projekt0n/github-nvim-theme",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme github_dark_default]]

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "bluz71/vim-moonfly-colors",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme moonfly]]

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
}
