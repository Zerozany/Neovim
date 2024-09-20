-- lua/plugins/lspconfig.lua
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'neovim/nvim-lspconfig',
    config = function()
        -- 全局配置 LSP 诊断
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        local lspconfig = require('lspconfig')
        -- 配置 Lua LSP
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        -- 允许使用 vim 全局变量
                        globals = { 'vim' }, 
                    },
                },
            },
        })
        -- 配置 C/C++ LSP
        lspconfig.clangd.setup({
            cmd = { "clangd" },  
            init_options = {
                clangdFileStatus = true,
                -- 添加 C++23 标准作为初始化选项
                usePlaceholders = true, 
                fallbackFlags = { "--std=c++23" },  
            },
            flags = {
                debounce_text_changes = 150,
            },
        })
    end,
})

