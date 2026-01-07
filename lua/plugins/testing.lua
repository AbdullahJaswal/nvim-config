-- ~/.config/nvim/lua/plugins/testing.lua
-- Test runner with adapters for vitest, playwright, and .NET
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adapters
      "marilari88/neotest-vitest",      -- Vitest (Next.js)
      "thenbe/neotest-playwright",       -- Playwright E2E
      "Issafalcon/neotest-dotnet",       -- .NET/xUnit/NUnit/MSTest
    },
    keys = {
      -- Space + t + t → Run nearest test
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
      -- Space + t + f → Run all tests in file
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
      -- Space + t + a → Run all tests in project
      { "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Run All Tests" },
      -- Space + t + s → Stop running test
      { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop Test" },
      -- Space + t + o → Show test output
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test Output" },
      -- Space + t + O → Toggle output panel
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      -- Space + t + S → Toggle test summary
      { "<leader>tS", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      -- Space + t + d → Debug nearest test
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest Test" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          -- Vitest for Next.js/React testing
          require("neotest-vitest")({
            vitestCommand = "npx vitest",
          }),
          -- Playwright for E2E testing
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          }),
          -- .NET testing (xUnit, NUnit, MSTest)
          require("neotest-dotnet")({
            discovery_root = "solution", -- or "project"
          }),
        },
        status = {
          virtual_text = true,
          signs = true,
        },
        output = {
          enabled = true,
          open_on_run = false,
        },
        quickfix = {
          enabled = true,
          open = false,
        },
      })
    end,
  },
}
