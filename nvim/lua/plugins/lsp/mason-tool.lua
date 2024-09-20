-- lua/plugins/mason-tool.lua
-- @param mason-tool 专注于工具的安装和管理
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup({
            -- :Mason
            ensure_installed = {
                -- 'stylua',           -- Lua 格式化工具
                -- 'lua-language-server', -- Lua LSP
                -- 'clangd',          -- C/C++ LSP
            },
            auto_update = true,
        })
    end,
})
