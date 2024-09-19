-- lua/plugins/notify.lua
-- @param 提示信息
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#1f2335", -- 背景颜色
            stages = "fade_in_slide_out",  -- 动画效果
            timeout = 2000,                -- 消息显示时间（毫秒）
            max_width = 60,                -- 最大宽度
            max_height = nil,              -- 最大高度
            render = "default",            -- 渲染方式
        })

        -- 确保 `nvim-notify` 被设置为默认的消息通知方式
        vim.notify = require("notify")
    end
})

-- 使用 `vim.notify` 发送通知示例
vim.notify("Message")
