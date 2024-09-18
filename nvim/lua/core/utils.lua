-- core/utils.lua
-- @param 配置执行套件
if not Zero then
    Zero = {}
end

if not Zero.utils then
    Zero.utils = {}
end

-- @param 基本核心设置函数
-- @param def options setting
function Zero.utils.set_options(options)
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

-- @param 快捷键设置函数
-- @param def keymaps setting
function Zero.utils.set_keymaps(keymaps)
    for _, mapping in ipairs(keymaps) do
        if type(mapping) == 'table' then
            local modes = mapping[1]
            local keys = mapping[2]
            local action = mapping[3]
            local options = mapping[4] or {}

            if type(modes) == 'table' then
                for _, mode in ipairs(modes) do
                    vim.api.nvim_set_keymap(mode, keys, action, options)
                end
            else
                vim.api.nvim_set_keymap(modes, keys, action, options)
            end
        end
    end
end
