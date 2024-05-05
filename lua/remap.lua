local k = vim.keymap
local telescope = require('telescope.builtin')
local harpoon = require("harpoon")
harpoon:setup({})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end


--- Remaps

-- v = View
k.set("n", "<leader>v", vim.cmd.NvimTreeOpen)
-- ff = find files
k.set("n", "<leader>ff", telescope.find_files, {})
-- gf = git files
k.set("n", "<leader>gf", telescope.git_files, {})
-- sf = search files
k.set("n", "<leader>sf", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- a = add
k.set("n", "<leader>a", function() harpoon:list():add() end)
k.set("n", "<C-l>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
k.set("n", "<C-n>", function() harpoon:list():select(1) end)
k.set("n", "<C-e>", function() harpoon:list():select(2) end)
k.set("n", "<C-i>", function() harpoon:list():select(3) end)
k.set("n", "<C-o>", function() harpoon:list():select(4) end)
k.set("n", "<C-S-P>", function() harpoon:list():prev() end)
k.set("n", "<C-S-N>", function() harpoon:list():next() end)
-- u = Undotree
k.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- gs = git status
k.set("n", "<leader>gs", vim.cmd.Neogit)
