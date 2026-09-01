--
--  lualine theme for darcula-java
--
--  Usage: require('lualine').setup({ options = { theme = 'darcula-java' } })
--
--  lualine builds its own highlight groups from the table below, and it builds
--  them after the colourscheme has finished, so the scheme's transparency pass
--  never reaches them. The flag is read here too, or the statusline would stay
--  a solid bar across an otherwise transparent editor.
--

local p = require('darcula-java.palette')

local transparent = vim.g.darcula_java_transparent and 'NONE' or nil

local function mode(accent)
    return {
        -- The mode block keeps its fill either way: it is the one part of the
        -- statusline that carries information in its colour.
        a = { fg = p.bg, bg = accent, gui = 'bold' },
        b = { fg = p.fg, bg = transparent or p.panel_light },
        c = { fg = p.fg, bg = transparent or p.panel },
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
        a = { fg = p.fg_dim, bg = transparent or p.bg_dark, gui = 'bold' },
        b = { fg = p.fg_dim, bg = transparent or p.bg_dark },
        c = { fg = p.fg_dim, bg = transparent or p.bg_dark },
    },
}
