vim.api.nvim_create_user_command("MapperOutput", function(args)
    local M = require("mapper")
    if args.args and args.args ~= "" then
        M.output_mappings(args.args)
    else
        M.output_mappings()
    end
end, {
    nargs = "?",
    complete = "customlist,v:lua.MapperOutput",
    range = "",
    bang = 0,
    count = 0,
    register = false,
    sync = false,
})
