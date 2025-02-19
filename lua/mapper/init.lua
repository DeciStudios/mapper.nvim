local merge = require("utils").merge
local cheatsheet = require("mapper-cheatsheet")
-- Initialize M once
local M = {}

function M.setup(...)
    M.keymaps = merge(...)
    M.apply()
end

function M.apply()
    local map = vim.keymap.set
    for name, maps in pairs(M.keymaps) do
        for mode, data in pairs(maps) do
            for key, val in pairs(data) do
                map(mode, key, val[1], { desc = val[2] })
            end
        end
    end
    if cheatsheet then
        cheatsheet.setup(M.keymaps)
    end
end

-- Function to add new mappings without reinitializing
function M.add_mappings(new_mappings)
    M.keymaps = merge(M.keymaps, new_mappings)
    M.apply()
end

function M.output_mappings(category)
    if category then
        for mode, data in pairs(M.keymaps[category]) do
            for key, val in pairs(data) do
                print(mode, key, val[1], val[2])
            end
        end
        return
    end
    for name, maps in pairs(M.keymaps) do
        print(name)
        for mode, data in pairs(maps) do
            for key, val in pairs(data) do
                print(mode, key, val[1], val[2])
            end
        end
    end
end

return M
