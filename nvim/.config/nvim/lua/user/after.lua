local autosave = require("autosave")
local lspconfig = require("lspconfig")

autosave.setup(
    {
        enabled = true,
    }
)

lspconfig.pylsp.setup {}

vim.schedule(function()
    vim.env.FZF_DEFAULT_COMMAND = 'fd --hidden --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f'
end)
