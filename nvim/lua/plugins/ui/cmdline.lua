-- lua/plugins/cmdline.lua
-- @param 状态栏
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('fine-cmdline').setup({
            cmdline = {
                enable_keymaps = true,
                smart_history = true,
                prompt = ': ',
            },
            popup = {
                position = {
                    row = '20%',
                    col = '50%',
                },
                size = {
                    width = '60%',
                    -- 弹出窗口的高度（行数）
                    height = 1,             
                },
                border = {
                     -- 设置边框样式：'single', 'double', 'rounded', 'solid'
                    style = 'rounded',
                    text = {
                        -- 设置边框上方的文本
                        top = Zero.symbols.Definition .. ' ZeroNvim ',  
                        -- 文本居中
                        top_align = 'center', 
                    },
                },
                win_options = {
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                },
            },
            hooks = {
                before_mount = function(input)
                    -- code
                end,
                after_mount = function(input)
                    -- code
                end,
                set_keymaps = function(imap, feedkeys)
                    -- code
                end,
            },
        })
    end,
    vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true }),
})
