-- lua/plugins/notify.lua
-- @param 提示信息
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            -- 背景颜色
            background_colour = "#1f2335", 
            -- 动画效果，可以设置为 "fade_in_slide_out", "slide", "static" 等
            stages = "fade_in_slide_out",  
            -- 消息显示时间（毫秒）
            timeout = 2000,        
            -- 最大宽度    
            minimum_width = 60,    
            max_width = 100,     
            -- 最大高度           
            max_height = nil,    
            -- 渲染方式          
            render = "default",            
        })
        
        -- 确保 `nvim-notify` 被设置为默认的消息通知方式
        vim.notify = require("notify")
    end
})

-- 使用 `vim.notify` 发送通知示例
vim.notify("ZeroNvim Message")
