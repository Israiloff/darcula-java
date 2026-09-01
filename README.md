# darcula-java

IntelliJ IDEA's **Darcula** colour scheme, ported to Neovim.

Every colour is the literal hex value from the stock JetBrains Darcula scheme
(*Settings ▸ Editor ▸ Color Scheme*), so a Java buffer in Neovim reads the same
way it does in IDEA — keywords in `#CC7832`, strings in `#6A8759`, fields in
`#9876AA`, method declarations in `#FFC66D`, annotations in `#BBB529`.

Built with [lush.nvim](https://github.com/rktjmp/lush.nvim).

---

## Requirements

| | |
|---|---|
| Neovim | 0.9 or newer (0.10+ recommended for the tree-sitter capture names) |
| Dependency | [`rktjmp/lush.nvim`](https://github.com/rktjmp/lush.nvim) |
| Terminal | true colour support — the theme enables `termguicolors` itself |

For Java specifically you'll also want the `java` tree-sitter parser
(`:TSInstall java`) and a language server such as
[`nvim-jdtls`](https://github.com/mfussenegger/nvim-jdtls).

---

## Installation

### lazy.nvim

```lua
{
  'Israiloff/darcula-java',
  lazy = false,        -- load during startup, it is the main colourscheme
  priority = 1000,     -- …and before every other plugin
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    vim.cmd.colorscheme('darcula-java')
  end,
}
```

### packer.nvim

```lua
use {
  'Israiloff/darcula-java',
  requires = 'rktjmp/lush.nvim',
  config = function()
    vim.cmd.colorscheme('darcula-java')
  end,
}
```

### vim-plug

```vim
Plug 'rktjmp/lush.nvim'
Plug 'Israiloff/darcula-java'

colorscheme darcula-java
```

### mini.deps

```lua
MiniDeps.add({ source = 'Israiloff/darcula-java', depends = { 'rktjmp/lush.nvim' } })
vim.cmd.colorscheme('darcula-java')
```

### Manual

```sh
git clone https://github.com/rktjmp/lush.nvim        ~/.local/share/nvim/site/pack/themes/start/lush.nvim
git clone https://github.com/Israiloff/darcula-java  ~/.local/share/nvim/site/pack/themes/start/darcula-java
```

---

## Usage

```vim
:colorscheme darcula-java
```

or, from Lua:

```lua
vim.cmd.colorscheme('darcula-java')
```

The colourscheme sets `background=dark`, `termguicolors`, `g:colors_name` and
the 16 `g:terminal_color_*` slots (IDEA's console palette) on its own.

### lualine

A matching statusline theme ships with the plugin:

```lua
require('lualine').setup({
  options = { theme = 'darcula-java' },
})
```

### Transparency

Set the flag before the scheme loads and every surface is handed back to the
terminal, so whatever is behind it — a wallpaper, a blurred desktop — shows
through:

```lua
vim.g.darcula_java_transparent = true
vim.cmd.colorscheme('darcula-java')
```

That covers the editor background, the gutter, popups and floats, the
statusline — the lualine theme reads the same flag, so its sections go with it,
keeping only the mode block that carries information in its colour — the tabline
and the tool-window panels. Accents keep their fill on
purpose: the caret row, the selection, search and diff highlights and the raised
panel behind the selected tab are what is left to tell one region from another
once the surfaces are gone.

Toggling it means setting the flag and loading the scheme again —
`vim.cmd.colorscheme('darcula-java')` rebuilds the highlights from scratch.

---

## What is covered

**Editor & UI** — every group in `:help highlight-groups`, including the
Neovim 0.10/0.11 additions (`WinBar`, `FloatTitle`, `FloatFooter`,
`PmenuMatch`, `CurSearch`, `SnippetTabstop`, `ComplMatchIns`, `LineNrAbove`…).

**Tree-sitter** — the full modern capture set (`@variable.member`,
`@keyword.modifier`, `@markup.*`, `@diff.*`, …), plus aliases for the handful
of pre-0.10 names still shipped by some queries.

**LSP** — diagnostics (text, underline, virtual text, floating, signs),
inlay hints, code lenses, references, and semantic tokens
(`@lsp.type.*`, `@lsp.typemod.*`) tuned so that a language server *refines*
the IDEA look instead of flattening it.

**Plugins** — nvim-cmp, Telescope, nvim-tree, lir.nvim, bufferline, lualine,
gitsigns, indent-blankline (v2 + v3), todo-comments, which-key, nvim-dap,
nvim-dap-ui, nvim-navic, toggleterm, nvim-scrollbar, alpha-nvim, grug-far,
lazy.nvim, mason.nvim, Copilot.

---

## Java specifics

IDEA colours **declarations**, not call sites. The theme reproduces that:

```java
@Service                                  // #BBB529  annotation
public class UserService {                // #CC7832 public/class, #A9B7C6 UserService
    private static final int MAX = 10;    // #CC7832 modifiers + int
                                          // #9876AA italic MAX, #6897BB 10
    private List<String> names;           // #9876AA names (instance field)

    public void run() {                   // #FFC66D run  ← declaration
        var s = "Hello\n";                // #6A8759 string, #CC7832 bold \n
        names.forEach(this::print);       // #A9B7C6 forEach  ← call site
    }
}
```

| Element | Colour |
|---|---|
| Keywords, modifiers, primitive types | `#CC7832` |
| Class / interface / package names | `#A9B7C6` |
| Method & constructor declarations | `#FFC66D` |
| Method calls | `#A9B7C6` |
| Instance fields, statics, enum members | `#9876AA` (italic when static) |
| Annotations | `#BBB529` |
| Strings | `#6A8759` |
| Numbers | `#6897BB` |
| Line & block comments | `#808080` |
| JavaDoc | `#629755` italic |
| Generic type parameters | `#507874` |
| Deprecated symbols | struck through |

Tree-sitter alone cannot tell a static field from an instance one, so the
static/abstract italics arrive once `jdtls` attaches and its semantic tokens
land on top.

For **other languages** the theme keeps one deliberate deviation from IDEA:
generic `@function.call` is gold rather than plain text. IDEA's plain-call rule
is very Java-shaped and makes Lua/JS/Python buffers read as a wall of grey.
Java itself keeps the exact IDEA behaviour via language-scoped overrides.

---

## Customising

### Reuse the palette

Every colour lives in one table:

```lua
local p = require('darcula-java.palette')

print(p.keyword)  --> #CC7832
print(p.field)    --> #9876AA
print(p.panel)    --> #3C3F41
```

### Override individual groups

```lua
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'darcula-java',
  callback = function()
    local p = require('darcula-java.palette')
    -- e.g. colour method calls like IDEA does *everywhere*, not just in Java
    vim.api.nvim_set_hl(0, '@function.call', { fg = p.fg })
    -- or make the gutter blend into the editor background
    vim.api.nvim_set_hl(0, 'LineNr', { fg = p.fg_gutter, bg = p.bg })
  end,
})

vim.cmd.colorscheme('darcula-java')
```

### Extend the spec with lush

```lua
local lush = require('lush')
local base = require('lush_theme.darcula-java')

local spec = lush.extends({ base }).with(function()
  return {
    Comment { base.Comment, gui = 'italic' },
    Normal  { base.Normal, bg = 'NONE' },   -- transparent background
  }
end)

lush(spec)
```

---

## Development

Open the spec and live-edit it:

```vim
:edit lua/lush_theme/darcula-java.lua
:Lushify
```

Colours are stored as plain hex strings rather than `hsl()` objects on purpose:
lush's `hsl()` round-trips through HSL floats and shifts most Darcula values by
1–3 units per channel, which is exactly the drift this port exists to avoid.
Palette edits go in `lua/darcula-java/palette.lua`; group mappings go in
`lua/lush_theme/darcula-java.lua`.

---

## License

MIT — see [LICENSE](LICENSE).

Darcula is a colour scheme by JetBrains s.r.o. This project is an independent
port and is not affiliated with or endorsed by JetBrains.
