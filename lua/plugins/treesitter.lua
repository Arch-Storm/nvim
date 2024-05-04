return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "dockerfile", "json", "lua", "prisma", "python", "toml", "javascript", "typescript", "tsx", "yaml", "html", "css" },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
        })
    end
}
