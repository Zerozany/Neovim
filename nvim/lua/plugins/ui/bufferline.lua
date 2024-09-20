-- lua/plugins/bufferline.lua
-- @param bufferline
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'akinsho/bufferline.nvim',
    dependencies = {
        'moll/vim-bbye',
        'nvim-tree/nvim-web-devicons',
    },
    version = '*',
    config = function()
        local os_name = vim.loop.os_uname().sysname
        local file_explorer_icon = '' -- 默认的图标
        -- 根据操作系统选择不同的图标
        if os_name == 'Windows_NT' then
            file_explorer_icon = Zero.symbols.Dos
        elseif os_name == 'Linux' then
            file_explorer_icon = Zero.symbols.Unix
        elseif os_name == 'Darwin' then
            file_explorer_icon = Zero.symbols.Mac
        end
        require('bufferline').setup({
            options = {
                mode = "buffers",
                -- 设置关闭缓冲区的命令
                close_command = 'Bdelete! %d',
                -- 设置右键关闭缓存区标签
                right_mouse_command = 'Bdelete! %d',
                -- 设置中键单击缓冲区标签的命令
                middle_mouse_command = nil,
                -- 随着 Neovim 主题的变化而变化
                themable = true,
                -- 设置是否在标签上显示诊断信息
                diagnostics = 'nvim_lsp',
                diagnostics_in_insert = true,
                -- 标签显示诊断图标
                diagnostics_indicator = function(_, _, diagnostics_dict, _)
                    local s = ' '
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == 'error' and Zero.symbols.Error
                            or (e == 'warning' and Zero.symbols.Warn or Zero.symbols.Info)
                        s = s .. n .. sym
                    end
                    return s
                end,
                -- 设置标签的显示样式
                indicator = {
                    icon = '',
                    style = 'underline',
                },
                -- 侧边栏配置
                offsets = {
                    {
                        filetype = 'NvimTree',
                        -- 根据系统选择文件树缓冲标签名称
                        text = file_explorer_icon .. ' File Explorer ' .. file_explorer_icon,
                        highlight = 'Directory',
                        text_align = 'center',
                    },
                },
                -- 鼠标监听事件
                hover = {
                    enabled = true,
                    delay = 50,
                    reveal = { 'close' },
                },
            },
        })
         -- 左右窗口切换
         vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { noremap = true, nowait = false, silent = false })
         vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { noremap = true, nowait = false, silent = false })
    end,
})
