-- lua/plugins/mason-tool.lua
-- @param mason-tool
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup({
            -- :mason
            ensure_installed = {
                -- 提供 Lua 语言的语言服务器协议 (LSP) 支持
                'stylua',
                'lua-language-server',
            },
            auto_update = true,
        })
    end,
})
