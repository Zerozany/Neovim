-- lua/plugins/nvim-colorizer.lua
-- @param  一个超快的显示hex颜色的插件
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup({
            filetypes = {            
                'cpp',
                'c',
                'python',
                'lua',
                'shell',
                'json', 
            },
        })
    end,
})
