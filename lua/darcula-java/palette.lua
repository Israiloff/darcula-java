--
--  darcula-java palette
--
--  Every value is the literal hex from the stock JetBrains Darcula colour
--  scheme (IntelliJ IDEA ▸ Settings ▸ Editor ▸ Color Scheme). They are kept as
--  plain strings on purpose: lush's `hsl()` round-trips through HSL floats and
--  shifts most of these by 1–3 units per channel, which is exactly the drift
--  this theme exists to avoid.
--
--  Reuse from your own config with:
--      local p = require('darcula-java.palette')
--

return {
    -- ─── Surfaces ──────────────────────────────────────────────────────────
    bg          = '#2B2B2B', -- editor background
    bg_dark     = '#262626', -- inactive windows, tabline fill
    panel       = '#3C3F41', -- tool windows, popups, status bar
    panel_light = '#4E5254', -- selected tab, raised panel
    gutter      = '#313335', -- line-number / sign column
    cursorline  = '#323232', -- caret row
    selection   = '#214283', -- editor selection
    sel_soft    = '#2D5177', -- selected row in a focused tool window
    sel_dim     = '#0D293E', -- selected row in an unfocused tool window
    border      = '#565A5C', -- popup / float borders
    separator   = '#4E5254', -- window splitters
    scrollbar   = '#595B5D',

    -- ─── Text ──────────────────────────────────────────────────────────────
    fg          = '#A9B7C6', -- default text
    fg_dim      = '#787878', -- unused / disabled symbols
    fg_gutter   = '#606366', -- line numbers
    caret       = '#BBBBBB',
    whitespace  = '#4B4B4B',

    -- ─── Syntax ────────────────────────────────────────────────────────────
    keyword     = '#CC7832', -- keywords, modifiers, primitive types
    number      = '#6897BB',
    string      = '#6A8759',
    regex       = '#A5C261',
    comment     = '#808080',
    doc         = '#629755', -- JavaDoc / doc comments
    annotation  = '#BBB529', -- @Annotation
    field       = '#9876AA', -- fields, constants, enum members
    method      = '#FFC66D', -- method / constructor declarations
    typaram     = '#507874', -- generic type parameters
    todo        = '#A8C023',
    link        = '#589DF6',

    -- ─── Semantics ─────────────────────────────────────────────────────────
    error       = '#CF5B56',
    warn        = '#BE9117',
    info        = '#6897BB',
    hint        = '#629755',
    typo        = '#659C6B', -- IDEA underlines typos with a green wave

    added       = '#629755',
    changed     = '#6897BB',
    removed     = '#CF5B56',

    -- ─── Diff / search / editor accents ────────────────────────────────────
    diff_add     = '#294436',
    diff_del     = '#484A4A',
    diff_chg     = '#2E3E4E',
    diff_text    = '#385570',
    diff_add_in  = '#3A6349', -- word-level insertion inside a changed line
    diff_del_in  = '#5C5F5F',
    conflict     = '#5C4028',
    search       = '#32593D',
    search_cur   = '#4C7A57',
    match_paren  = '#3B514D',
    fold_bg      = '#3A3A3A',
    fold_fg      = '#8C8C8C',
    ref_read     = '#344134', -- identifier under caret
    ref_write    = '#40332E', -- write access to identifier under caret
    dap_stopped  = '#3D4B41',
    indent       = '#3B3B3B',
    indent_scope = '#5E5E5E',
    tree_icon    = '#AFB1B3',

    -- Muted foreground / background pairs used for inline diagnostics.
    vt_error_fg = '#B85450', vt_error_bg = '#4B3232',
    vt_warn_fg  = '#A38124', vt_warn_bg  = '#52503A',
    vt_info_fg  = '#5A82A0', vt_info_bg  = '#2F3F4C',
    vt_hint_fg  = '#55804B', vt_hint_bg  = '#33452F',

    -- ─── Terminal (IDEA's Darcula console palette) ─────────────────────────
    terminal = {
        [0]  = '#000000', [1]  = '#FF6B68', [2]  = '#A8C023', [3]  = '#D6BF55',
        [4]  = '#5394EC', [5]  = '#AE8ABE', [6]  = '#299999', [7]  = '#999999',
        [8]  = '#555555', [9]  = '#FF8785', [10] = '#A8C023', [11] = '#FFFF00',
        [12] = '#7EAEF1', [13] = '#FF99FF', [14] = '#6CDADA', [15] = '#FFFFFF',
    },
}
