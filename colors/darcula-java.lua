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

-- ─── Terminal palette (IDEA's Darcula console colours) ─────────────────────
for index, colour in pairs(require('darcula-java.palette').terminal) do
    vim.g['terminal_color_' .. index] = colour
end
