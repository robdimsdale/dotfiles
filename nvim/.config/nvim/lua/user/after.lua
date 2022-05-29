local autosave = require("autosave")
local lspconfig = require("lspconfig")

autosave.setup(
    {
        enabled = true,
    }
)

lspconfig.pylsp.setup {}
