require("primary.core.keymaps")
require("primary.core.options")

local venv_path = os.getenv("VIRTUAL_ENV")
if venv_path then
    vim.g.python3_host_prog = venv_path .. "/bin/python"
end
