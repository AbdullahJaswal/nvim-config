return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local util = require("lspconfig.util")

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure python server
    local venv_path = os.getenv("VIRTUAL_ENV")
    local python_path = venv_path and (venv_path .. "/bin/python") or "python"

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            pythonPath = python_path,
          },
        },
      },
    })

    -- configure go server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure volar (vue) server
    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "vue" },
      init_options = {
        typescript = {
          tsdk = "/usr/local/lib/node_modules/typescript/lib",
        },
      },
    })

    -- configure rust server
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = {
              "unresolved_proc_macro",
            },
          },
        },
      },
    })

    -- configure java server
    lspconfig["java_language_server"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure yaml server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure svelte server
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "typescript", "javascript", "svelte", "html", "css" },
    })

    -- Set filetype for `.compose.yaml` files
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.compose.yaml",
      callback = function()
        vim.bo.filetype = "yaml.docker-compose"
      end,
    })

    -- configure docker compose server
    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml.docker-compose" },
      single_file_support = true,
    })

    -- configure dockerfile server
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure terraform server
    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- Configure Swift LSP (sourcekit)
    lspconfig["sourcekit"].setup({
      capabilities = capabilities, -- Inherit capabilities from your LSP setup (e.g., autocompletion support)
      on_attach = function(client, bufnr)
        on_attach(client, bufnr) -- Call the common on_attach function
        -- You can define Swift-specific keybindings or setup here
        -- For example, setting up keymaps for Swift:
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      end,
      filetypes = { "swift", "objective-c", "objective-cpp" }, -- List of file types for which sourcekit should be active

      root_dir = function(fname)
        return lspconfig.util.root_pattern("Package.swift", "*.xcodeproj", ".git")(fname)
          or lspconfig.util.path.dirname(fname)
      end,

      settings = {
        -- You can add any specific sourcekit settings here, although sourcekit-lsp doesn't have many configurable options.
        -- For example, you could set completion preferences, diagnostics, or any other LSP behavior if necessary.
      },
      single_file_support = true, -- Enable support for single Swift files outside a project
    })

    -- Configure clangd server
    lspconfig["clangd"].setup({
      cmd = { "clangd", "--clang-tidy" }, -- Specify the command with additional arguments
      capabilities = capabilities, -- Inherit capabilities from your LSP setup
      on_attach = on_attach, -- Call the common on_attach function
    })

    -- configure sql server
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "sql", "mysql", "psql" },
      root_dir = function(_)
        return vim.loop.cwd()
      end,
    })
  end,
}
