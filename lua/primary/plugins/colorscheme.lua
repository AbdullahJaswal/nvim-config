return {
  {
      "pineapplegiant/spaceduck",
      priority = 1000,
      config = function(_, opts)
          vim.opt.termguicolors = true

          vim.cmd [[colorscheme spaceduck]]
      end,
  },
}
