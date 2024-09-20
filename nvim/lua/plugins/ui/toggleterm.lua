-- lua/plugins/toggleterm.lua
-- @param terminal
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- 设置终端窗口的默认高度/宽度
            size = 20,
            -- 映射用于打开终端的快捷键
            open_mapping = [[<c-\>]],
            -- 隐藏终端缓冲区中的行号
            hide_numbers = true,
            -- 启用终端窗口阴影
            shade_terminals = true,
            -- 设置终端阴影的不透明度（介于 1 到 3 之间）
            shading_factor = 2,
            -- 打开终端时自动进入插入模式
            start_in_insert = true,
            -- 在终端之间保持窗口大小
            persist_size = true,
            -- 方向（'vertical', 'horizontal', 'float' 或 'tab'）
            direction = 'float',
            -- 关闭终端时保持窗口大小
            close_on_exit = true,
            -- 设置默认的 shell
            shell = vim.o.shell,
            float_opts = {
                -- 浮动终端窗口的边框样式（'single', 'double', 'shadow' 'curved' 等）
                border = 'curved',
                -- 设置浮动窗口的不透明度(0,100)
                winblend = 0,
            },
        })
    end,
})
