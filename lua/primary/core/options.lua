-- local opt = vim.opt -- for conciseness
vim.wo.number = true

vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "svelte" },
  callback = function()
    vim.opt.colorcolumn = "100"
  end,
})

vim.o.wrap = true
vim.diagnostic.config({
  virtual_text = {
    wrap = true,
    spacing = 2,
  },
  float = {
    max_width = 80,
  },
})

vim.o.cmdheight = 0

local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")

package.path = package.path
  .. ";"
  .. home_dir
  .. "/.luarocks/share/lua/5.1/?.lua"
  .. ";"
  .. home_dir
  .. "/.luarocks/share/lua/5.1/?/init.lua"

package.cpath = package.cpath .. ";" .. home_dir .. "/.luarocks/lib/lua/5.1/?.so"
