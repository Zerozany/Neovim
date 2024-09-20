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
            '                                                                  ',
            '                                                                  ',
            '███████╗███████╗██████╗  ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
            '╚══███╔╝██╔════╝██╔══██╗██╔═══██╗████╗  ██║██║   ██║██║████╗ ████║',
            '  ███╔╝ █████╗  ██████╔╝██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║',
            ' ███╔╝  ██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            '███████╗███████╗██║  ██║╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
            '╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',  
            '                                                                  ',
            '                                                                  ',
        }
        -- 设置 Telescope 查找文件选项
        dashboard.section.buttons.val = {
            dashboard.button('f', Zero.symbols.TypeParameter .. '  Open File', ':Telescope find_files <CR>'),
            dashboard.button("s", Zero.symbols.Constructor .. '  Settings', ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", Zero.symbols.Exit .. '  Quit', ":qa<CR>"),
        }
        -- 只保留 header、buttons 和 footer
        dashboard.config.layout = {
            { type = 'padding', val = 2 },
            dashboard.section.header,
            { type = 'padding', val = 2 },
            dashboard.section.buttons,
            { type = 'padding', val = 2 }, 
            dashboard.section.footer, 
        }

        -- 设置页脚
        dashboard.section.footer.val = "Welcome to ZeroNvim"

        alpha.setup(dashboard.config)
    end,
})
