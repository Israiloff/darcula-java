--
--  lualine theme for darcula-java
--
--  Usage: require('lualine').setup({ options = { theme = 'darcula-java' } })
--

local p = require('darcula-java.palette')

local function mode(accent)
    return {
        a = { fg = p.bg, bg = accent, gui = 'bold' },
        b = { fg = p.fg, bg = p.panel_light },
        c = { fg = p.fg, bg = p.panel },
    }
end

return {
    normal   = mode(p.link),
    insert   = mode(p.added),
    visual   = mode(p.field),
    replace  = mode(p.error),
    command  = mode(p.method),
    terminal = mode('#299999'),
    inactive = {
        a = { fg = p.fg_dim, bg = p.bg_dark, gui = 'bold' },
        b = { fg = p.fg_dim, bg = p.bg_dark },
        c = { fg = p.fg_dim, bg = p.bg_dark },
    },
}
