-- lua/plugins/gitsigns.lua
-- @param gitsigns
if not Zero.plugins then
    Zero.plugins = {}
end

-- git 插件
table.insert(Zero.plugins, {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({})
    end,
})
