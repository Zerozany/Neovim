-- lua/plugins/cmp.lua
-- @param 智能补全插件

if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'hrsh7th/nvim-cmp',  -- 插件名称：nvim-cmp，智能补全插件
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',  -- LSP 源支持
        'hrsh7th/cmp-buffer',     -- 缓冲区补全源
        'hrsh7th/cmp-path',       -- 文件路径补全源
        'hrsh7th/cmp-cmdline',    -- 命令行补全源
        'saadparwaiz1/cmp_luasnip',  -- 如果使用 LuaSnip 的话
    },
    config = function()
        local cmp = require('cmp')  -- 引入 nvim-cmp 模块
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)  -- 使用 LuaSnip 扩展
                end,
            },
            mapping = {
                ['<C-n>'] = cmp.mapping.select_next_item(),  -- 选择下一个补全项
                ['<C-p>'] = cmp.mapping.select_prev_item(),  -- 选择上一个补全项
                ['<C-Space>'] = cmp.mapping.complete(),        -- 显示补全菜单
                ['<C-e>'] = cmp.mapping.close(),               -- 关闭补全菜单
                ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- 确认选择的补全项
            },
            sources = {
                { name = 'nvim_lsp' },  -- LSP 源
                { name = 'buffer' },     -- 缓冲区源
                { name = 'path' },       -- 路径源
                { name = 'cmdline' },    -- 命令行源
            },
        })
        -- 配置命令行补全
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'cmdline' },  -- 使用命令行补全源
                { name = 'path' },      -- 可选：路径补全
            },
        })
    end,
})
