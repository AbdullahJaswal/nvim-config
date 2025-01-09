return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#6F3F43" }) -- Original: #E06C75
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#7E6C41" }) -- Original: #E5C07B
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#325666" }) -- Original: #61AFEF
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#664C33" }) -- Original: #D19A66
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#485E3C" }) -- Original: #98C379
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#58385E" }) -- Original: #C678DD
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#274D53" }) -- Original: #56B6C2
    end)

    require("ibl").setup({ indent = { highlight = highlight } })
  end,
}
