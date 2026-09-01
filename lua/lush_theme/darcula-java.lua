--
--  darcula-java — IntelliJ IDEA "Darcula" for Neovim
--
--  Colour values come from the stock JetBrains Darcula colour scheme
--  (Settings ▸ Editor ▸ Color Scheme) so that a Java buffer in Neovim reads
--  exactly like the same file in IDEA. They live in `darcula-java.palette`;
--  this file only maps them onto highlight groups.
--
--  Built with lush.nvim — run `:Lushify` in this buffer to live-edit it.
--

local lush = require('lush')
local p    = require('darcula-java.palette')

-- GUI attribute shorthands
local bf, it, un, st = 'bold', 'italic', 'underline', 'strikethrough'

-- Surfaces
local bg, bg_dark, panel, panel_light = p.bg, p.bg_dark, p.panel, p.panel_light
local gutter, cursorline, selection   = p.gutter, p.cursorline, p.selection
local sel_soft, sel_dim               = p.sel_soft, p.sel_dim
local border, separator, scrollbar    = p.border, p.separator, p.scrollbar

-- Text
local fg, fg_dim, fg_gutter = p.fg, p.fg_dim, p.fg_gutter
local caret, whitespace     = p.caret, p.whitespace

-- Syntax
local keyword, number, str, comment = p.keyword, p.number, p.string, p.comment
local doc, annotation, field        = p.doc, p.annotation, p.field
local method, typaram, todo, link   = p.method, p.typaram, p.todo, p.link

-- Semantics
local err, warn, info, hint, ok, typo = p.error, p.warn, p.info, p.hint, p.hint, p.typo
local added, changed, removed         = p.added, p.changed, p.removed

-- Diff / search / editor accents
local diff_add, diff_del, diff_chg, diff_text = p.diff_add, p.diff_del, p.diff_chg, p.diff_text
local search, search_cur, match_paren         = p.search, p.search_cur, p.match_paren
local fold_bg, fold_fg                        = p.fold_bg, p.fold_fg

---@diagnostic disable: undefined-global
return lush(function(injected_functions)
    local sym = injected_functions.sym

    return {
        ---- Editor ------------------------------------------------------------
        Normal { fg = fg, bg = bg },
        NormalNC { Normal },                                  -- text in non-current windows
        NormalFloat { fg = fg, bg = panel },
        FloatBorder { fg = border, bg = panel },
        FloatTitle { fg = fg, bg = panel, gui = bf },
        FloatFooter { fg = fg_dim, bg = panel },
        EndOfBuffer { fg = bg },                              -- IDEA has no `~` filler
        Cursor { fg = bg, bg = caret },
        lCursor { Cursor },
        CursorIM { Cursor },
        TermCursor { Cursor },
        Directory { fg = fg },
        Title { fg = link, gui = bf },

        ColorColumn { bg = gutter },
        CursorColumn { bg = cursorline },
        CursorLine { bg = cursorline },
        Visual { bg = selection },
        VisualNOS { bg = sel_dim },
        MatchParen { bg = match_paren, gui = bf },
        Conceal { fg = fg_dim },
        NonText { fg = whitespace },
        Whitespace { fg = whitespace },
        SpecialKey { fg = whitespace },
        SnippetTabstop { bg = sel_dim },

        LineNr { fg = fg_gutter, bg = gutter },
        LineNrAbove { LineNr },
        LineNrBelow { LineNr },
        CursorLineNr { fg = fg, bg = gutter },
        SignColumn { LineNr },
        CursorLineSign { LineNr },
        FoldColumn { LineNr },
        CursorLineFold { LineNr },
        Folded { fg = fold_fg, bg = fold_bg },

        WinSeparator { fg = separator },
        VertSplit { WinSeparator },

        ---- Search ------------------------------------------------------------
        Search { fg = fg, bg = search },
        CurSearch { fg = fg, bg = search_cur },
        IncSearch { CurSearch },
        Substitute { fg = fg, bg = p.conflict },

        ---- Popup menu --------------------------------------------------------
        Pmenu { fg = fg, bg = panel },
        PmenuSel { fg = fg, bg = sel_soft },
        PmenuKind { fg = field, bg = panel },
        PmenuKindSel { fg = field, bg = sel_soft },
        PmenuExtra { fg = fg_dim, bg = panel },
        PmenuExtraSel { fg = fg_dim, bg = sel_soft },
        PmenuSbar { bg = panel_light },
        PmenuThumb { bg = scrollbar },
        PmenuMatch { fg = link, bg = panel, gui = bf },
        PmenuMatchSel { fg = link, bg = sel_soft, gui = bf },
        ComplMatchIns { fg = fg_dim },
        WildMenu { PmenuSel },
        QuickFixLine { bg = sel_dim },

        ---- Status / tab lines ------------------------------------------------
        StatusLine { fg = fg, bg = panel },
        StatusLineNC { fg = fg_dim, bg = bg_dark },
        StatusLineTerm { StatusLine },
        StatusLineTermNC { StatusLineNC },
        WinBar { fg = fg, bg = bg },
        WinBarNC { fg = fg_dim, bg = bg },
        TabLine { fg = fg_dim, bg = panel },
        TabLineSel { fg = fg, bg = panel_light },
        TabLineFill { bg = bg_dark },

        ---- Messages ----------------------------------------------------------
        MsgArea { fg = fg },
        MsgSeparator { fg = separator },
        ModeMsg { fg = fg, gui = bf },
        MoreMsg { fg = added },
        Question { fg = link },
        ErrorMsg { fg = err },
        WarningMsg { fg = warn },

        ---- Spelling (IDEA underlines typos with a green wave) ----------------
        SpellBad { sp = typo, undercurl = true },
        SpellCap { sp = warn, undercurl = true },
        SpellLocal { sp = info, undercurl = true },
        SpellRare { sp = field, undercurl = true },

        ---- Diff --------------------------------------------------------------
        DiffAdd { bg = diff_add },
        DiffChange { bg = diff_chg },
        DiffDelete { fg = fg_dim, bg = diff_del },
        DiffText { bg = diff_text },
        Added { fg = added },
        Changed { fg = changed },
        Removed { fg = removed },
        diffAdded { Added },
        diffRemoved { Removed },
        diffChanged { Changed },
        diffNewFile { Added },
        diffOldFile { Removed },
        diffFile { fg = link },
        diffLine { fg = comment },
        diffIndexLine { fg = field },

        ---- Legacy syntax groups (`:help group-name`) -------------------------
        Comment { fg = comment },

        Constant { fg = field },
        String { fg = str },
        Character { fg = str },
        Number { fg = number },
        Float { Number },
        Boolean { fg = keyword },

        Identifier { fg = fg },
        Function { fg = method },

        Statement { fg = keyword },
        Conditional { Statement },
        Repeat { Statement },
        Label { Statement },
        Operator { fg = fg },
        Keyword { Statement },
        Exception { Statement },

        PreProc { fg = keyword },
        Include { PreProc },
        Define { PreProc },
        Macro { PreProc },
        PreCondit { PreProc },

        Type { fg = fg },
        StorageClass { fg = keyword },
        Structure { fg = keyword },
        Typedef { fg = fg },

        Special { fg = keyword },
        SpecialChar { fg = keyword, gui = bf },
        Tag { fg = annotation },
        Delimiter { fg = fg },
        SpecialComment { fg = comment, gui = bf },
        Debug { fg = err },

        Underlined { gui = un },
        Bold { gui = bf },
        Italic { gui = it },
        Ignore { fg = fg_dim },
        Error { fg = err },
        Todo { fg = todo, gui = bf },

        ---- Diagnostics -------------------------------------------------------
        DiagnosticError { fg = err },
        DiagnosticWarn { fg = warn },
        DiagnosticInfo { fg = info },
        DiagnosticHint { fg = hint },
        DiagnosticOk { fg = ok },

        DiagnosticUnderlineError { sp = err, undercurl = true },
        DiagnosticUnderlineWarn { sp = warn, undercurl = true },
        DiagnosticUnderlineInfo { sp = info, undercurl = true },
        DiagnosticUnderlineHint { sp = hint, undercurl = true },
        DiagnosticUnderlineOk { sp = ok, undercurl = true },

        DiagnosticVirtualTextError { fg = p.vt_error_fg, bg = p.vt_error_bg },
        DiagnosticVirtualTextWarn { fg = p.vt_warn_fg, bg = p.vt_warn_bg },
        DiagnosticVirtualTextInfo { fg = p.vt_info_fg, bg = p.vt_info_bg },
        DiagnosticVirtualTextHint { fg = p.vt_hint_fg, bg = p.vt_hint_bg },
        DiagnosticVirtualTextOk { DiagnosticVirtualTextHint },

        DiagnosticFloatingError { fg = err, bg = panel },
        DiagnosticFloatingWarn { fg = warn, bg = panel },
        DiagnosticFloatingInfo { fg = info, bg = panel },
        DiagnosticFloatingHint { fg = hint, bg = panel },
        DiagnosticFloatingOk { fg = ok, bg = panel },

        DiagnosticSignError { fg = err, bg = gutter },
        DiagnosticSignWarn { fg = warn, bg = gutter },
        DiagnosticSignInfo { fg = info, bg = gutter },
        DiagnosticSignHint { fg = hint, bg = gutter },
        DiagnosticSignOk { fg = ok, bg = gutter },

        DiagnosticDeprecated { fg = fg_dim, sp = fg_dim, gui = st },
        DiagnosticUnnecessary { fg = fg_dim },

        ---- LSP ---------------------------------------------------------------
        LspReferenceText { bg = p.ref_read },  -- identifier under caret
        LspReferenceRead { bg = p.ref_read },
        LspReferenceWrite { bg = p.ref_write }, -- write access under caret
        LspInlayHint { fg = fg_dim, bg = gutter, gui = it },
        LspCodeLens { fg = fg_dim, gui = it },
        LspCodeLensSeparator { fg = whitespace },
        LspSignatureActiveParameter { fg = method, gui = bf },
        LspInfoBorder { FloatBorder },

        -- Backwards-compatible names (Neovim < 0.8 style, still used by plugins)
        LspDiagnosticsDefaultError { DiagnosticError },
        LspDiagnosticsDefaultWarning { DiagnosticWarn },
        LspDiagnosticsDefaultInformation { DiagnosticInfo },
        LspDiagnosticsDefaultHint { DiagnosticHint },
        LspDiagnosticsUnderlineError { DiagnosticUnderlineError },
        LspDiagnosticsUnderlineWarning { DiagnosticUnderlineWarn },
        LspDiagnosticsUnderlineInformation { DiagnosticUnderlineInfo },
        LspDiagnosticsUnderlineHint { DiagnosticUnderlineHint },

        ---- Tree-sitter: variables & constants --------------------------------
        sym '@variable' { fg = fg },
        sym '@variable.builtin' { fg = keyword },          -- this, super
        sym '@variable.parameter' { fg = fg },
        sym '@variable.parameter.builtin' { fg = fg },
        sym '@variable.member' { fg = field },             -- object fields
        sym '@property' { fg = field },
        sym '@constant' { fg = field, gui = it },          -- IDEA italicises statics
        sym '@constant.builtin' { fg = keyword },
        sym '@constant.macro' { fg = field, gui = it },
        sym '@module' { fg = fg },
        sym '@module.builtin' { fg = fg },
        sym '@label' { fg = keyword },

        ---- Tree-sitter: literals ---------------------------------------------
        sym '@string' { fg = str },
        sym '@string.documentation' { fg = doc },
        sym '@string.regexp' { fg = p.regex },
        sym '@string.escape' { fg = keyword, gui = bf },
        sym '@string.special' { fg = keyword },
        sym '@string.special.symbol' { fg = field },
        sym '@string.special.path' { fg = str, gui = un },
        sym '@string.special.url' { fg = link, gui = un },
        sym '@character' { fg = str },
        sym '@character.special' { fg = keyword, gui = bf },
        sym '@boolean' { fg = keyword },
        sym '@number' { fg = number },
        sym '@number.float' { fg = number },

        ---- Tree-sitter: types ------------------------------------------------
        sym '@type' { fg = fg },                           -- IDEA leaves classes plain
        sym '@type.builtin' { fg = keyword },              -- int, void, boolean
        sym '@type.definition' { fg = fg },
        sym '@attribute' { fg = annotation },
        sym '@attribute.builtin' { fg = annotation },

        ---- Tree-sitter: functions --------------------------------------------
        sym '@function' { fg = method },
        sym '@function.builtin' { fg = keyword },
        sym '@function.call' { fg = method },
        sym '@function.macro' { fg = method },
        sym '@function.method' { fg = method },
        sym '@function.method.call' { fg = method },
        sym '@constructor' { fg = fg },
        sym '@operator' { fg = fg },

        ---- Tree-sitter: keywords ---------------------------------------------
        sym '@keyword' { fg = keyword },
        sym '@keyword.coroutine' { fg = keyword },
        sym '@keyword.function' { fg = keyword },
        sym '@keyword.operator' { fg = keyword },
        sym '@keyword.import' { fg = keyword },
        sym '@keyword.type' { fg = keyword },
        sym '@keyword.modifier' { fg = keyword },
        sym '@keyword.repeat' { fg = keyword },
        sym '@keyword.return' { fg = keyword },
        sym '@keyword.debug' { fg = keyword },
        sym '@keyword.exception' { fg = keyword },
        sym '@keyword.conditional' { fg = keyword },
        sym '@keyword.conditional.ternary' { fg = fg },
        sym '@keyword.directive' { fg = keyword },
        sym '@keyword.directive.define' { fg = keyword },

        ---- Tree-sitter: punctuation ------------------------------------------
        sym '@punctuation.delimiter' { fg = fg },
        sym '@punctuation.bracket' { fg = fg },
        sym '@punctuation.special' { fg = keyword },

        ---- Tree-sitter: comments ---------------------------------------------
        sym '@comment' { fg = comment },
        sym '@comment.documentation' { fg = doc, gui = it },
        sym '@comment.error' { fg = bg, bg = err, gui = bf },
        sym '@comment.warning' { fg = bg, bg = warn, gui = bf },
        sym '@comment.todo' { fg = bg, bg = todo, gui = bf },
        sym '@comment.note' { fg = bg, bg = hint, gui = bf },

        ---- Tree-sitter: markup (markdown, help, …) ---------------------------
        sym '@markup.strong' { fg = fg, gui = bf },
        sym '@markup.italic' { fg = fg, gui = it },
        sym '@markup.strikethrough' { fg = fg, gui = st },
        sym '@markup.underline' { fg = fg, gui = un },
        sym '@markup.heading' { fg = method, gui = bf },
        sym '@markup.heading.1' { fg = method, gui = bf },
        sym '@markup.heading.2' { fg = method, gui = bf },
        sym '@markup.heading.3' { fg = annotation, gui = bf },
        sym '@markup.heading.4' { fg = annotation, gui = bf },
        sym '@markup.heading.5' { fg = field, gui = bf },
        sym '@markup.heading.6' { fg = field, gui = bf },
        sym '@markup.quote' { fg = comment, gui = it },
        sym '@markup.math' { fg = number },
        sym '@markup.link' { fg = link },
        sym '@markup.link.label' { fg = link },
        sym '@markup.link.url' { fg = link, gui = un },
        sym '@markup.raw' { fg = str },
        sym '@markup.raw.block' { fg = str },
        sym '@markup.list' { fg = keyword },
        sym '@markup.list.checked' { fg = added },
        sym '@markup.list.unchecked' { fg = fg_dim },

        ---- Tree-sitter: diff & tags ------------------------------------------
        sym '@diff.plus' { fg = added },
        sym '@diff.minus' { fg = removed },
        sym '@diff.delta' { fg = changed },
        sym '@tag' { fg = keyword },
        sym '@tag.builtin' { fg = keyword },
        sym '@tag.attribute' { fg = annotation },
        sym '@tag.delimiter' { fg = fg },

        ---- Tree-sitter: legacy capture aliases -------------------------------
        -- A handful of queries still ship pre-0.10 capture names.
        sym '@field' { fg = field },
        sym '@parameter' { fg = fg },
        sym '@namespace' { fg = fg },
        sym '@method' { fg = method },
        sym '@include' { fg = keyword },
        sym '@annotation' { fg = annotation },
        sym '@conditional' { fg = keyword },
        sym '@repeat' { fg = keyword },
        sym '@symbol' { fg = field },
        sym '@float' { fg = number },
        sym '@error' { fg = err },

        ---- Java: IDEA-exact overrides ----------------------------------------
        -- IDEA colours *declarations*, not call sites: `foo()` in
        -- `obj.foo()` stays default text while `void foo()` is gold.
        sym '@type.java' { fg = fg },                        -- class / ctor names
        sym '@type.builtin.java' { fg = keyword },           -- int, boolean, void
        sym '@variable.java' { fg = fg },                    -- locals
        sym '@variable.member.java' { fg = field },          -- instance fields
        sym '@variable.parameter.java' { fg = fg },
        sym '@variable.builtin.java' { fg = keyword },       -- this, super
        sym '@constant.java' { fg = field, gui = it },       -- static final
        sym '@constant.builtin.java' { fg = keyword },       -- null, true, false
        sym '@function.method.java' { fg = method },         -- declarations
        sym '@function.method.call.java' { fg = fg },        -- call sites
        sym '@function.builtin.java' { fg = keyword },       -- super(...)
        sym '@attribute.java' { fg = annotation },           -- @Override
        sym '@keyword.modifier.java' { fg = keyword },
        sym '@comment.documentation.java' { fg = doc, gui = it },
        sym '@string.escape.java' { fg = keyword, gui = bf },
        sym '@label.java' { fg = fg },

        ---- LSP semantic tokens ------------------------------------------------
        -- Semantic tokens sit above tree-sitter (priority 125 vs 100), so these
        -- have the final say once a language server attaches.
        sym '@lsp.type.class' { fg = fg },
        sym '@lsp.type.interface' { fg = fg },
        sym '@lsp.type.enum' { fg = fg },
        sym '@lsp.type.struct' { fg = fg },
        sym '@lsp.type.type' { fg = fg },
        sym '@lsp.type.typeParameter' { fg = typaram },
        sym '@lsp.type.namespace' { fg = fg },
        sym '@lsp.type.parameter' { fg = fg },
        sym '@lsp.type.variable' { fg = fg },
        sym '@lsp.type.property' { fg = field },
        sym '@lsp.type.enumMember' { fg = field, gui = it },
        sym '@lsp.type.annotation' { fg = annotation },
        sym '@lsp.type.decorator' { fg = annotation },
        sym '@lsp.type.event' { fg = field },
        sym '@lsp.type.method' { fg = method },
        -- IDEA's plain-call rule is Java-shaped, so it is scoped to Java;
        -- the `declaration` modifier below still paints declarations gold.
        sym '@lsp.type.method.java' { fg = fg },
        sym '@lsp.type.function' { fg = method },
        sym '@lsp.type.macro' { fg = keyword },
        sym '@lsp.type.modifier' { fg = keyword },
        sym '@lsp.type.keyword' { fg = keyword },
        sym '@lsp.type.operator' { fg = fg },
        sym '@lsp.type.number' { fg = number },
        sym '@lsp.type.string' { fg = str },
        sym '@lsp.type.comment' { fg = comment },

        -- Modifiers add the IDEA emphasis on top.
        sym '@lsp.typemod.method.declaration' { fg = method },
        sym '@lsp.typemod.method.definition' { fg = method },
        sym '@lsp.typemod.method.static' { gui = it },
        sym '@lsp.typemod.function.declaration' { fg = method },
        sym '@lsp.typemod.function.static' { gui = it },
        sym '@lsp.typemod.property.static' { fg = field, gui = it },
        sym '@lsp.typemod.property.readonly' { fg = field },
        sym '@lsp.typemod.variable.static' { fg = field, gui = it },
        sym '@lsp.typemod.variable.defaultLibrary' { fg = keyword },
        sym '@lsp.typemod.class.abstract' { fg = fg, gui = it },
        sym '@lsp.typemod.method.abstract' { gui = it },
        sym '@lsp.mod.deprecated' { fg = fg_dim, sp = fg_dim, gui = st },

        ---- Vim help & markdown builtins --------------------------------------
        helpHyperTextJump { fg = link, gui = un },
        HelpHyperTextJump { fg = link, gui = un },
        helpSpecial { fg = annotation },
        helpExample { fg = str },
        markdownLinkText { fg = link, gui = un },
        markdownUrl { fg = link, gui = un },
        markdownCode { fg = str },
        markdownCodeBlock { fg = str },

        ---- nvim-cmp ----------------------------------------------------------
        CmpItemAbbr { fg = fg },
        CmpItemAbbrDeprecated { fg = fg_dim, gui = st },
        CmpItemAbbrMatch { fg = link, gui = bf },
        CmpItemAbbrMatchFuzzy { fg = link, gui = bf },
        CmpItemMenu { fg = fg_dim, gui = it },
        CmpItemKind { fg = field },
        CmpItemKindText { fg = fg },
        CmpItemKindMethod { fg = method },
        CmpItemKindFunction { fg = method },
        CmpItemKindConstructor { fg = method },
        CmpItemKindField { fg = field },
        CmpItemKindVariable { fg = fg },
        CmpItemKindClass { fg = annotation },
        CmpItemKindInterface { fg = annotation },
        CmpItemKindModule { fg = keyword },
        CmpItemKindProperty { fg = field },
        CmpItemKindUnit { fg = number },
        CmpItemKindValue { fg = number },
        CmpItemKindEnum { fg = annotation },
        CmpItemKindKeyword { fg = keyword },
        CmpItemKindSnippet { fg = doc },
        CmpItemKindColor { fg = field },
        CmpItemKindFile { fg = fg },
        CmpItemKindReference { fg = fg },
        CmpItemKindFolder { fg = fg },
        CmpItemKindEnumMember { fg = field },
        CmpItemKindConstant { fg = field, gui = it },
        CmpItemKindStruct { fg = annotation },
        CmpItemKindEvent { fg = field },
        CmpItemKindOperator { fg = fg },
        CmpItemKindTypeParameter { fg = typaram },
        CmpItemKindCopilot { fg = doc },

        ---- Telescope ---------------------------------------------------------
        TelescopeNormal { fg = fg, bg = panel },
        TelescopeBorder { fg = border, bg = panel },
        TelescopeTitle { fg = fg, bg = panel_light, gui = bf },
        TelescopePromptNormal { fg = fg, bg = panel_light },
        TelescopePromptBorder { fg = panel_light, bg = panel_light },
        TelescopePromptTitle { fg = bg, bg = method, gui = bf },
        TelescopePromptPrefix { fg = keyword, bg = panel_light },
        TelescopePromptCounter { fg = fg_dim, bg = panel_light },
        TelescopeResultsNormal { fg = fg, bg = panel },
        TelescopeResultsBorder { fg = panel, bg = panel },
        TelescopeResultsTitle { fg = panel, bg = panel },
        TelescopePreviewNormal { fg = fg, bg = panel },
        TelescopePreviewBorder { fg = panel, bg = panel },
        TelescopePreviewTitle { fg = bg, bg = added, gui = bf },
        TelescopeSelection { fg = fg, bg = sel_soft },
        TelescopeSelectionCaret { fg = method, bg = sel_soft },
        TelescopeMultiSelection { fg = field, bg = panel },
        TelescopeMultiIcon { fg = method },
        TelescopeMatching { fg = link, gui = bf },

        ---- nvim-tree ---------------------------------------------------------
        NvimTreeNormal { fg = fg, bg = panel },
        NvimTreeNormalNC { fg = fg, bg = panel },
        NvimTreeNormalFloat { fg = fg, bg = panel },
        NvimTreeEndOfBuffer { fg = panel, bg = panel },
        NvimTreeWinSeparator { fg = separator, bg = panel },
        NvimTreeVertSplit { NvimTreeWinSeparator },
        NvimTreeStatusLine { fg = fg, bg = panel },
        NvimTreeStatusLineNC { fg = fg_dim, bg = panel },
        NvimTreeCursorLine { bg = sel_soft },
        NvimTreeCursorLineNr { fg = fg, bg = sel_soft },
        NvimTreeRootFolder { fg = fg, gui = bf },
        NvimTreeFolderIcon { fg = p.tree_icon },
        NvimTreeFolderName { fg = fg },
        NvimTreeOpenedFolderName { fg = fg, gui = bf },
        NvimTreeEmptyFolderName { fg = fg_dim },
        NvimTreeClosedFolderIcon { fg = p.tree_icon },
        NvimTreeOpenedFolderIcon { fg = p.tree_icon },
        NvimTreeSymlink { fg = link, gui = un },
        NvimTreeSymlinkFolderName { fg = link },
        NvimTreeExecFile { fg = added, gui = bf },
        NvimTreeSpecialFile { fg = annotation },
        NvimTreeImageFile { fg = field },
        NvimTreeOpenedFile { fg = fg, gui = bf },
        NvimTreeModifiedFile { fg = changed },
        NvimTreeBookmark { fg = method },
        NvimTreeIndentMarker { fg = whitespace },
        NvimTreeLiveFilterPrefix { fg = method, gui = bf },
        NvimTreeLiveFilterValue { fg = fg, gui = bf },
        NvimTreeWindowPicker { fg = bg, bg = method, gui = bf },
        NvimTreeGitNewIcon { fg = added },
        NvimTreeGitDirtyIcon { fg = changed },
        NvimTreeGitStagedIcon { fg = added },
        NvimTreeGitMergeIcon { fg = warn },
        NvimTreeGitRenamedIcon { fg = changed },
        NvimTreeGitDeletedIcon { fg = removed },
        NvimTreeGitIgnoredIcon { fg = fg_dim },
        NvimTreeGitFileNewHL { fg = added },
        NvimTreeGitFileDirtyHL { fg = changed },
        NvimTreeGitFileStagedHL { fg = added },
        NvimTreeGitFileMergeHL { fg = warn },
        NvimTreeGitFileRenamedHL { fg = changed },
        NvimTreeGitFileDeletedHL { fg = removed },
        NvimTreeGitFileIgnoredHL { fg = fg_dim },

        ---- lir.nvim ----------------------------------------------------------
        LirFloatNormal { fg = fg, bg = panel },
        LirFloatBorder { fg = border, bg = panel },
        LirDir { fg = fg, gui = bf },
        LirSymLink { fg = link, gui = un },
        LirEmptyDirText { fg = fg_dim },

        ---- bufferline --------------------------------------------------------
        BufferLineFill { bg = bg_dark },
        BufferLineBackground { fg = fg_dim, bg = panel },
        BufferLineBufferVisible { fg = fg_dim, bg = panel },
        BufferLineBufferSelected { fg = fg, bg = panel_light, gui = bf },
        BufferLineTab { fg = fg_dim, bg = panel },
        BufferLineTabSelected { fg = fg, bg = panel_light, gui = bf },
        BufferLineTabSeparator { fg = bg_dark, bg = panel },
        BufferLineTabSeparatorSelected { fg = bg_dark, bg = panel_light },
        BufferLineTabClose { fg = removed, bg = panel },
        BufferLineSeparator { fg = bg_dark, bg = panel },
        BufferLineSeparatorVisible { fg = bg_dark, bg = panel },
        BufferLineSeparatorSelected { fg = bg_dark, bg = panel_light },
        BufferLineIndicatorSelected { fg = method, bg = panel_light },
        BufferLineIndicatorVisible { fg = panel, bg = panel },
        BufferLineModified { fg = changed, bg = panel },
        BufferLineModifiedVisible { fg = changed, bg = panel },
        BufferLineModifiedSelected { fg = changed, bg = panel_light },
        BufferLineCloseButton { fg = fg_dim, bg = panel },
        BufferLineCloseButtonVisible { fg = fg_dim, bg = panel },
        BufferLineCloseButtonSelected { fg = removed, bg = panel_light },
        BufferLineDuplicate { fg = fg_dim, bg = panel, gui = it },
        BufferLineDuplicateVisible { fg = fg_dim, bg = panel, gui = it },
        BufferLineDuplicateSelected { fg = fg, bg = panel_light, gui = it },
        BufferLineNumbers { fg = fg_dim, bg = panel },
        BufferLineNumbersVisible { fg = fg_dim, bg = panel },
        BufferLineNumbersSelected { fg = fg, bg = panel_light },
        BufferLinePick { fg = method, bg = panel, gui = bf },
        BufferLinePickVisible { fg = method, bg = panel, gui = bf },
        BufferLinePickSelected { fg = method, bg = panel_light, gui = bf },
        BufferLineOffsetSeparator { fg = separator, bg = bg_dark },
        BufferLineTruncMarker { fg = fg_dim, bg = panel },
        BufferLineError { fg = err, bg = panel },
        BufferLineErrorVisible { fg = err, bg = panel },
        BufferLineErrorSelected { fg = err, bg = panel_light },
        BufferLineWarning { fg = warn, bg = panel },
        BufferLineWarningVisible { fg = warn, bg = panel },
        BufferLineWarningSelected { fg = warn, bg = panel_light },
        BufferLineInfo { fg = info, bg = panel },
        BufferLineInfoVisible { fg = info, bg = panel },
        BufferLineInfoSelected { fg = info, bg = panel_light },
        BufferLineHint { fg = hint, bg = panel },
        BufferLineHintVisible { fg = hint, bg = panel },
        BufferLineHintSelected { fg = hint, bg = panel_light },

        ---- gitsigns ----------------------------------------------------------
        GitSignsAdd { fg = added, bg = gutter },
        GitSignsChange { fg = changed, bg = gutter },
        GitSignsDelete { fg = removed, bg = gutter },
        GitSignsTopdelete { fg = removed, bg = gutter },
        GitSignsChangedelete { fg = warn, bg = gutter },
        GitSignsUntracked { fg = fg_dim, bg = gutter },
        GitSignsAddNr { fg = added, bg = gutter },
        GitSignsChangeNr { fg = changed, bg = gutter },
        GitSignsDeleteNr { fg = removed, bg = gutter },
        GitSignsAddLn { bg = diff_add },
        GitSignsChangeLn { bg = diff_chg },
        GitSignsDeleteLn { bg = diff_del },
        GitSignsAddInline { bg = p.diff_add_in },
        GitSignsChangeInline { bg = diff_text },
        GitSignsDeleteInline { bg = p.diff_del_in },
        GitSignsAddPreview { bg = diff_add },
        GitSignsDeletePreview { bg = diff_del },
        GitSignsCurrentLineBlame { fg = fg_dim, gui = it },

        ---- indent-blankline (v3) ---------------------------------------------
        IblIndent { fg = p.indent },
        IblWhitespace { fg = p.indent },
        IblScope { fg = p.indent_scope },
        -- v2 names
        IndentBlanklineChar { fg = p.indent },
        IndentBlanklineContextChar { fg = p.indent_scope },

        ---- todo-comments -----------------------------------------------------
        TodoBgTODO { fg = bg, bg = todo, gui = bf },
        TodoFgTODO { fg = todo },
        TodoSignTODO { fg = todo, bg = gutter },
        TodoBgFIX { fg = bg, bg = err, gui = bf },
        TodoFgFIX { fg = err },
        TodoSignFIX { fg = err, bg = gutter },
        TodoBgHACK { fg = bg, bg = warn, gui = bf },
        TodoFgHACK { fg = warn },
        TodoSignHACK { fg = warn, bg = gutter },
        TodoBgWARN { fg = bg, bg = warn, gui = bf },
        TodoFgWARN { fg = warn },
        TodoSignWARN { fg = warn, bg = gutter },
        TodoBgPERF { fg = bg, bg = field, gui = bf },
        TodoFgPERF { fg = field },
        TodoSignPERF { fg = field, bg = gutter },
        TodoBgNOTE { fg = bg, bg = hint, gui = bf },
        TodoFgNOTE { fg = hint },
        TodoSignNOTE { fg = hint, bg = gutter },
        TodoBgTEST { fg = bg, bg = info, gui = bf },
        TodoFgTEST { fg = info },
        TodoSignTEST { fg = info, bg = gutter },

        ---- which-key ---------------------------------------------------------
        WhichKey { fg = method, gui = bf },
        WhichKeyGroup { fg = link },
        WhichKeyDesc { fg = fg },
        WhichKeySeparator { fg = fg_dim },
        WhichKeyValue { fg = fg_dim },
        WhichKeyFloat { bg = panel },
        WhichKeyBorder { fg = border, bg = panel },
        WhichKeyNormal { fg = fg, bg = panel },
        WhichKeyTitle { fg = fg, bg = panel_light, gui = bf },
        WhichKeyIcon { fg = field },
        WhichKeyIconAzure { fg = info },
        WhichKeyIconBlue { fg = link },
        WhichKeyIconCyan { fg = typaram },
        WhichKeyIconGreen { fg = added },
        WhichKeyIconGrey { fg = fg_dim },
        WhichKeyIconOrange { fg = keyword },
        WhichKeyIconPurple { fg = field },
        WhichKeyIconRed { fg = err },
        WhichKeyIconYellow { fg = method },

        ---- nvim-dap / nvim-dap-ui --------------------------------------------
        DapBreakpoint { fg = err, bg = gutter },
        DapBreakpointCondition { fg = keyword, bg = gutter },
        DapBreakpointRejected { fg = fg_dim, bg = gutter },
        DapLogPoint { fg = info, bg = gutter },
        DapStopped { fg = method, bg = gutter },
        DapStoppedLine { bg = p.dap_stopped },
        -- sign highlight names used by this colourscheme's own sign_define docs
        DapBreakpointHL { DapBreakpoint },
        DapBreakpointConditionHL { DapBreakpointCondition },
        DapBreakpointRejectedHL { DapBreakpointRejected },
        DapLogPointHL { DapLogPoint },
        DapStoppedHL { DapStopped },

        DapUINormal { fg = fg, bg = panel },
        DapUIVariable { fg = fg },
        DapUIScope { fg = method },
        DapUIType { fg = typaram },
        DapUIValue { fg = fg },
        DapUIModifiedValue { fg = method, gui = bf },
        DapUIDecoration { fg = border },
        DapUIThread { fg = added },
        DapUIStoppedThread { fg = method },
        DapUIFrameName { fg = fg },
        DapUISource { fg = field },
        DapUILineNumber { fg = fg_gutter },
        DapUIFloatNormal { fg = fg, bg = panel },
        DapUIFloatBorder { fg = border, bg = panel },
        DapUIWatchesEmpty { fg = fg_dim },
        DapUIWatchesValue { fg = added },
        DapUIWatchesError { fg = err },
        DapUIBreakpointsPath { fg = link },
        DapUIBreakpointsInfo { fg = added },
        DapUIBreakpointsCurrentLine { fg = method, gui = bf },
        DapUIBreakpointsLine { fg = fg_gutter },
        DapUIBreakpointsDisabledLine { fg = fg_dim },
        DapUIStepOver { fg = link },
        DapUIStepInto { fg = link },
        DapUIStepBack { fg = link },
        DapUIStepOut { fg = link },
        DapUIStop { fg = err },
        DapUIPlayPause { fg = added },
        DapUIRestart { fg = added },
        DapUIUnavailable { fg = fg_dim },
        DapUIWinSelect { fg = method, gui = bf },
        DapUIEndofBuffer { fg = panel, bg = panel },

        ---- nvim-navic (winbar breadcrumbs) -----------------------------------
        NavicText { fg = fg },
        NavicSeparator { fg = fg_dim },
        NavicIconsFile { fg = fg },
        NavicIconsModule { fg = keyword },
        NavicIconsNamespace { fg = fg },
        NavicIconsPackage { fg = keyword },
        NavicIconsClass { fg = annotation },
        NavicIconsMethod { fg = method },
        NavicIconsProperty { fg = field },
        NavicIconsField { fg = field },
        NavicIconsConstructor { fg = method },
        NavicIconsEnum { fg = annotation },
        NavicIconsInterface { fg = annotation },
        NavicIconsFunction { fg = method },
        NavicIconsVariable { fg = fg },
        NavicIconsConstant { fg = field, gui = it },
        NavicIconsString { fg = str },
        NavicIconsNumber { fg = number },
        NavicIconsBoolean { fg = keyword },
        NavicIconsArray { fg = fg },
        NavicIconsObject { fg = fg },
        NavicIconsKey { fg = field },
        NavicIconsNull { fg = keyword },
        NavicIconsEnumMember { fg = field },
        NavicIconsStruct { fg = annotation },
        NavicIconsEvent { fg = field },
        NavicIconsOperator { fg = fg },
        NavicIconsTypeParameter { fg = typaram },

        ---- toggleterm --------------------------------------------------------
        ToggleTerm1FloatBorder { fg = border, bg = panel },
        ToggleTermNormal { fg = fg, bg = bg },
        ToggleTermNormalFloat { fg = fg, bg = panel },
        ToggleTermFloatBorder { fg = border, bg = panel },

        ---- nvim-scrollbar ----------------------------------------------------
        ScrollbarHandle { bg = panel_light },
        ScrollbarCursorHandle { bg = panel_light },
        ScrollbarCursor { fg = caret },
        ScrollbarError { fg = err },
        ScrollbarErrorHandle { fg = err, bg = panel_light },
        ScrollbarWarn { fg = warn },
        ScrollbarWarnHandle { fg = warn, bg = panel_light },
        ScrollbarInfo { fg = info },
        ScrollbarInfoHandle { fg = info, bg = panel_light },
        ScrollbarHint { fg = hint },
        ScrollbarHintHandle { fg = hint, bg = panel_light },
        ScrollbarMisc { fg = field },
        ScrollbarMiscHandle { fg = field, bg = panel_light },
        ScrollbarSearch { fg = search_cur },
        ScrollbarSearchHandle { fg = search_cur, bg = panel_light },
        ScrollbarGitAdd { fg = added },
        ScrollbarGitAddHandle { fg = added, bg = panel_light },
        ScrollbarGitChange { fg = changed },
        ScrollbarGitChangeHandle { fg = changed, bg = panel_light },
        ScrollbarGitDelete { fg = removed },
        ScrollbarGitDeleteHandle { fg = removed, bg = panel_light },

        ---- alpha-nvim (dashboard) --------------------------------------------
        AlphaHeader { fg = keyword },
        AlphaButtons { fg = fg },
        AlphaShortcut { fg = method },
        AlphaFooter { fg = fg_dim, gui = it },

        ---- grug-far ----------------------------------------------------------
        GrugFarHelpHeader { fg = fg_dim },
        GrugFarHelpHeaderKey { fg = method },
        GrugFarInputLabel { fg = link, gui = bf },
        GrugFarInputPlaceholder { fg = fg_dim, gui = it },
        GrugFarResultsHeader { fg = fg_dim },
        GrugFarResultsPath { fg = link, gui = un },
        GrugFarResultsLineNo { fg = fg_gutter },
        GrugFarResultsMatch { fg = fg, bg = search },
        GrugFarResultsMatchAdded { fg = added },
        GrugFarResultsMatchRemoved { fg = removed, gui = st },
        GrugFarResultsStats { fg = fg_dim },

        ---- lazy.nvim / mason -------------------------------------------------
        LazyNormal { fg = fg, bg = panel },
        LazyButton { fg = fg, bg = panel_light },
        LazyButtonActive { fg = bg, bg = method, gui = bf },
        LazyH1 { fg = bg, bg = method, gui = bf },
        LazyH2 { fg = method, gui = bf },
        LazyProgressDone { fg = added, gui = bf },
        LazyProgressTodo { fg = fg_dim },
        LazySpecial { fg = link },
        LazyCommit { fg = doc },
        LazyReasonPlugin { fg = field },
        MasonNormal { fg = fg, bg = panel },
        MasonHeader { fg = bg, bg = method, gui = bf },
        MasonHeaderSecondary { fg = bg, bg = field, gui = bf },
        MasonHighlight { fg = link },
        MasonHighlightBlock { fg = bg, bg = link },
        MasonHighlightBlockBold { fg = bg, bg = link, gui = bf },
        MasonMuted { fg = fg_dim },
        MasonMutedBlock { fg = fg, bg = panel_light },
        MasonError { fg = err },

        ---- copilot / inline suggestions --------------------------------------
        CopilotSuggestion { fg = fg_dim, gui = it },
        CopilotAnnotation { fg = fg_dim, gui = it },
    }
end)
---@diagnostic enable: undefined-global
