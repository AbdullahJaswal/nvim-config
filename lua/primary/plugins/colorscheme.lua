return {
  
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
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        vim.opt.termguicolors = true

        vim.cmd [[colorscheme ayu-dark]]

        -- Set background transparency
        -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
        -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
    end,
  },
  -- {
  --     "tiagovla/tokyodark.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme tokyodark]]

  --         -- Turn off italics
  --         vim.cmd [[
  --             highlight Comment cterm=NONE gui=NONE
  --             highlight Keyword cterm=NONE gui=NONE
  --             highlight Type cterm=NONE gui=NONE
  --             highlight Function cterm=NONE gui=NONE
  --             highlight Statement cterm=NONE gui=NONE
  --         ]]

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "hachy/eva01.vim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme eva01]]

  --         -- Set background transparency
  --         vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
  -- {
  --     "bartekprtc/gruv-vsassist.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme gruv-vsassist]]

  --         -- Applying color overrides
  --         require('gruv-vsassist').setup({
  --           color_overrides = {
  --               vscBack = '#101010',
  --           },
  --         })

  --         -- Set background transparency
  --         -- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
  --         -- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
  --     end,
  -- },
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
  --     "notken12/base46-colors",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(_, opts)
  --         vim.opt.termguicolors = true

  --         vim.cmd [[colorscheme tokyodark]]

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
