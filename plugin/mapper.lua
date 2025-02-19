vim.api.nvim_create_user_command("MapperOutput", function(args)
    local M = require("mapper")
    if args.args and args.args ~= "" then
        M.output_mappings(args.args)
    else
        M.output_mappings()
    end
end, {
    nargs = "?", -- Optional argument
    desc = "Output mapper keymaps"
})
