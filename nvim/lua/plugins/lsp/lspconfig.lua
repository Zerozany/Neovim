-- lua/plugins/lspconfig.lua
-- @param lspconfig
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

        -- lua
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })
    end,
})

-- 示例：映射一个按键来在源文件和头文件之间切换
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
