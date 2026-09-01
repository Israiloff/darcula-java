--
--  darcula-java — IntelliJ IDEA "Darcula" for Neovim
--  https://github.com/Israiloff/darcula-java
--
--  Load with `:colorscheme darcula-java` or, from Lua,
--  `vim.cmd.colorscheme('darcula-java')`.
--

if vim.fn.has('nvim-0.9') == 0 then
    vim.notify('darcula-java requires Neovim 0.9 or newer', vim.log.levels.ERROR)
    return
end

local ok_lush, lush = pcall(require, 'lush')
if not ok_lush then
    vim.notify(
        'darcula-java requires lush.nvim — add "rktjmp/lush.nvim" as a dependency',
        vim.log.levels.ERROR
    )
    return
end

-- Reset any highlights left behind by a previously loaded colourscheme.
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
end

-- The palette is 24-bit only; without termguicolors every group falls back to
-- the terminal's own 16 colours and the theme looks nothing like Darcula.
if vim.fn.has('termguicolors') == 1 then
    vim.o.termguicolors = true
end

vim.o.background = 'dark'
vim.g.colors_name = 'darcula-java'

-- Drop the cached module so `:Lushify` / repeated `:colorscheme` calls always
-- pick up edits to the spec. Costs a few hundred nanoseconds.
package.loaded['lush_theme.darcula-java'] = nil
package.loaded['darcula-java.palette'] = nil

lush(require('lush_theme.darcula-java'))

-- ─── Transparency ──────────────────────────────────────────────────────────
--
--  Set `vim.g.darcula_java_transparent = true` before loading the scheme and
--  every surface is handed back to the terminal, so a wallpaper behind it shows
--  through: the editor background, the gutter, the tool-window and popup panels
--  and the inactive-window fill.
--
--  This runs over the finished highlights rather than over the palette, because
--  the surface colours are also used as *foregrounds* — dark text on a coloured
--  badge (`TodoBgTODO`, `MasonHeader`, `LazyH1`) and the `~` filler are all
--  `fg = bg`. Blanking the palette would turn those invisible; blanking only
--  backgrounds cannot.
--
--  Accents keep their fill on purpose. The caret row, the selection, the search
--  and diff highlights and the raised panel that marks the selected tab are what
--  is left to tell one region from another once the surfaces are gone.
if vim.g.darcula_java_transparent then
    local p = require('darcula-java.palette')
    local surfaces = {}

    for _, colour in ipairs({ p.bg, p.bg_dark, p.panel, p.gutter }) do
        surfaces[tonumber(colour:sub(2), 16)] = true
    end

    for name, definition in pairs(vim.api.nvim_get_hl(0, {})) do
        if definition.bg and surfaces[definition.bg] then
            definition.bg = nil
            definition.ctermbg = nil
            vim.api.nvim_set_hl(0, name, definition)
        end
    end

    --  A few groups use the raised panel colour as a surface rather than as an
    --  accent: Telescope's prompt is a box you type into, not a marker. Colour
    --  cannot tell them apart — the same value marks the selected tab, which
    --  has to keep its fill — so they are named.
    for _, name in ipairs({
        'TelescopeTitle',
        'TelescopePromptNormal',
        'TelescopePromptBorder',
        'TelescopePromptPrefix',
        'TelescopePromptCounter',
    }) do
        local definition = vim.api.nvim_get_hl(0, { name = name, link = false })
        definition.bg = nil
        definition.ctermbg = nil
        vim.api.nvim_set_hl(0, name, definition)
    end

    --  The prompt border was painted in the box's own fill so that it vanished
    --  into it. With the box gone it has to go back to being a border, or the
    --  prompt loses its outline and floats loose over the wallpaper.
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = p.border })
end

-- ─── Terminal palette (IDEA's Darcula console colours) ─────────────────────
for index, colour in pairs(require('darcula-java.palette').terminal) do
    vim.g['terminal_color_' .. index] = colour
end
