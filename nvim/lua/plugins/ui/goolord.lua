-- lua/plugins/.lua
-- @param
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        -- 设置启动界面头部
        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }
        -- 设置 Telescope 查找文件选项
        dashboard.section.buttons.val = {
            dashboard.button('f', Zero.symbols.Folder .. '  Open File', ':Telescope find_files <CR>'),
        }
        -- 只保留 header 和 buttons
        dashboard.config.layout = {
            { type = 'padding', val = 2 },
            dashboard.section.header,
            { type = 'padding', val = 2 },
            dashboard.section.buttons,
        }
        alpha.setup(dashboard.config)
    end,
})
