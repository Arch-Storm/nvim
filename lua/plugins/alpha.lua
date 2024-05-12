ANIME = {
  { "demon-slayer-daki.txt", 173 },
  { "code-geass-lelouch.txt", 174 },
  { "demon-slayer-kyoujurou.txt", 174 },
  { "demon-slayer-mitsuri.txt", 174 },
  { "demon-slayer-nezuko-daki.txt", 174 },
  { "fate-rin.txt", 173 },
  { "jjk-gojo.txt", 160 },
  { "mob-psycho.txt", 174 },
  { "opm-saitama.txt", 175 },
  { "fate-saber.txt", 174 },
  { "fate-shirou.txt", 175 },
  { "monogatari-araragi.txt", 175 },
  { "monogatari-kaiki.txt", 175 },
  { "monogatari-ougi.txt", 160 },
  { "monogatari-ougi-araragi.txt", 175 },
  { "monogatari-shinobu-araragi.txt", 227 },
  { "death-note-l.txt", 147 },
  { "death-note-light.txt", 175 },
  { "death-note-ryuk.txt", 175 },
  { "baki-yujiro.txt", 174 },
  { "kara-no-kyoukai-shiki.txt", 176 },
}

return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    require "alpha.term"
    require "math"

    local button = dashboard.button

    dashboard.opts.opts.noautocmd = false
    dashboard.section.terminal.opts.redraw = true
    math.randomseed(os.time())
    local idx = math.random(1, #ANIME)
    local info = ANIME[idx]
    local configDir = os.getenv "LOCALAPPDATA" .. "\\nvim"
    local path = configDir .. "\\lua\\plugins\\ansiArt\\"

    dashboard.section.terminal.command = path .. "rustyAscii.exe " .. path .. info[1]
    dashboard.section.terminal.width = info[2]
    dashboard.section.terminal.height = 50

    dashboard.leader = "␣"
    dashboard.section.buttons.val = {
        button("e", "x New File", "<cmd>ene <CR>"),
        button("f", "x Find File", "<cmd>Telescope everything <CR>"),
        button("c", "x Open Config", ":e $LOCALAPPDATA\\nvim\\init.lua | :silent cd %:p:h | split . | wincmd k <CR>"),
        button("q", "x Quit", "<cmd>qa <CR>"),
    }

    dashboard.opts.layout = {
      { type = "padding", val = 2 },
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

    local function setLaststatus()
      if vim.bo.filetype == "alpha" then
        if vim.opt.laststatus == 0 then return end
        vim.opt.laststatus = 0
        vim.g.neovide_scale_factor = 0.75
      else
        if vim.opt.laststatus == 3 then return end
        vim.opt.laststatus = 3
        vim.g.neovide_scale_factor = 1
      end
    end
    setLaststatus()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      desc = "Hide statusline in Alpha",
      callback = setLaststatus,
    })
    end,
}

