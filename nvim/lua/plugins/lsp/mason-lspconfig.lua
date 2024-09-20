-- lua/plugins/mason-lspconfig.lua
-- @param mason-lspconfig 旨在将安装的工具与 Neovim 的 LSP 客户端进行集成
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {
                -- 'lua_ls',  -- Lua LSP
                -- 'clangd',  -- C/C++ LSP
                -- 'cmake',   -- CMake LSP
            },
            automatic_installation = true,
        })
    end,
})
