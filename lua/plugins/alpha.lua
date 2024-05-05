ANIME = {
  { "02_gif.txt", 84, 25 },
  { "02_1_gif.txt", 81, 25 },
  { "02_2_gif.txt", 81, 25 },
  { "02_3_gif.txt", 88, 27 },
  { "02_4_gif.txt", 86, 27 },
  { "02_5_gif.txt", 81, 25 },
  { "02_6_gif.txt", 81, 25 },
}

return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    require "alpha.term"

    dashboard.opts.opts.noautocmd = false
    dashboard.section.terminal.opts.redraw = true
    local idx = math.random(1, #ANIME)
    local info = ANIME[idx]
    local path = os.getenv "LOCALAPPDATA" .. "\\nvim\\lua\\plugins\\banner\\"

    dashboard.section.terminal.command = path .. "rustyAscii.exe " .. path .. info[1]
    dashboard.section.terminal.width = info[2]
    dashboard.section.terminal.height = info[3]

    dashboard.opts.layout = {
      dashboard.section.terminal,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    -- no Idea how it works exaclty, try n error with distinguishable colors lol
    dashboard.opts.layout = {
      dashboard.section.terminal,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }
    return dashboard
  end,
  config = function(_, opts)
    require("alpha").setup(opts.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        opts.section.footer.val = { " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
        opts.section.footer.opts.hl = "DashboardFooter"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- Function to set linespace based on filetype
    local function set_linespace()
      if vim.bo.filetype == "alpha" then
        if vim.go.linespace == -4 then return end
        vim.go.linespace = -4 -- Change this to your desired linespace value
      else
        if vim.go.linespace == 0 then return end
        vim.go.linespace = 0
      end
    end
    set_linespace()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = set_linespace,
    })
  end,
}

