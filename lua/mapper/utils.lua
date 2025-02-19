local M = {}
function M.merge(...)
    local M = {}
    for _, tbl in pairs({ ... }) do
        for k, v in pairs(tbl) do
            if type(k) == "number" then
                table.insert(M, v)
            else
                M[k] = v
            end
        end
    end
    return M
end

return M
