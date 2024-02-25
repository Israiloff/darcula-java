--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

-- local lush = require('lush')
-- local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
-- local theme = lush(function(injected_functions)
--   local sym = injected_functions.sym
  -- return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal         { }, -- Normal text
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    -- Constant       { }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    -- Statement      { }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
-- }
-- end)

-- Return our parsed theme for extension or use elsewhere.
-- return theme

-- vi:nowrap


--------------------------------------------------
-- GUI options
local bf, it, un = 'bold', 'italic', 'underline'

-- Base colors
local c0 = hsl(240, 1, 15)
local c1 = c0.lighten(40)
local c2 = c1.lighten(2)
local c3 = c2.lighten(20).sa(10)
local c4 = c3.lighten(10)
local c5 = c4.lighten(20)
local c6 = c5.lighten(70)
local c7 = c6.lighten(80)

-- Set base colors
local bg      = c0    -- base background
local overbg  = c1    -- other backgrounds
local subtle  = c2    -- out-of-buffer elements

local fg      = hsl(210, 7, 82)
local comment = hsl(0, 0, 54)    -- comments
local folder  = hsl(202, 9, 57)
local treebg  = hsl(220, 3, 19)
local mid     = c2.lighten(10)   -- either foreground or background
local faded   = fg.darken(45)    -- non-important text elements
local pop     = c7

-- Color palette
local red     = hsl(1, 77, 59)
local salmon  = hsl(10,  90, 70)
local orange  = hsl(27, 61, 50)
local yellow  = hsl(37, 100, 71)

local green   = hsl(83, 27, 53)
local teal    = hsl(150,  40, 50)
local cyan    = hsl(180, 58, 38)

local blue    = hsl(215, 80, 63).li(10)
local purple  = hsl(279, 30, 62)
local magenta = hsl(310,  40, 70)


return lush(function(injected_functions) 
local sym = injected_functions.sym
return {
Normal       { fg=fg,      bg=bg };
NormalFloat  { fg=fg,      bg=overbg };
NormalNC     { fg=fg,      bg=bg.da(10) }; -- normal text in non-current windows

Comment      { fg=comment,  gui=it };
Whitespace   { fg=mid };                  -- 'listchars'
Conceal      { fg=hsl(0, 0, 25) };
NonText      { fg=treebg };              -- characters that don't exist in the text
SpecialKey   { Whitespace };              -- Unprintable characters: text displayed differently from what it really is


Cursor       { fg=bg,      bg=fg };
TermCursor   { fg=bg,      bg=fg };
ColorColumn  { bg=overbg };
CursorColumn { bg=subtle };
CursorLine   { CursorColumn };
MatchParen   { fg=pop,     bg=mid };

LineNr       { fg=faded };
CursorLineNr { fg=orange };
SignColumn   { LineNr };
VertSplit    { fg=overbg,  bg=bg };    -- column separating vertically split windows
Folded       { fg=comment, bg=overbg };
FoldColumn   { LineNr };

Pmenu        { bg=overbg };                -- Popup menu normal item
PmenuSel     { bg=mid };                   -- selected item
PmenuSbar    { Pmenu };                    -- scrollbar
PmenuThumb   { PmenuSel };                 -- Thumb of the scrollbar
WildMenu     { Pmenu };                    -- current match in 'wildmenu' completion
QuickFixLine { fg=pop };                   -- Current |quickfix| item in the quickfix window

StatusLine   { bg=subtle };
StatusLineNC { fg=faded,   bg=overbg };

TabLine      { bg=mid };                   -- not active tab page label
TabLineFill  { bg=overbg };                -- where there are no labels
TabLineSel   { bg=faded };                 -- active tab page label

Search       { fg=bg,      bg=yellow };    -- Last search pattern highlighting (see 'hlsearch')
IncSearch    { Search };                   -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Substitute   { Search };                   -- |:substitute| replacement text highlighting

Visual       { bg=c2 };                    -- Visual mode selection
VisualNOS    { bg=subtle };                -- Visual mode selection when Vim is "Not Owning the Selection".

ModeMsg      { fg=faded };                 -- 'showmode' message (e.g. "-- INSERT -- ")
MsgArea      { Normal };                   -- Area for messages and cmdline
MsgSeparator { fg=orange };                -- Separator for scrolled messages `msgsep` flag of 'display'
MoreMsg      { fg=green };                 -- |more-prompt|
Question     { fg=green };                 -- |hit-enter| prompt and yes/no questions
ErrorMsg     { fg=red };                   -- error messages on the command line
WarningMsg   { fg=red };                   -- warning messages

Directory    { fg=blue };                  -- directory names (and other special names in listings)
Title        { fg=blue };                  -- titles for output from ":set all" ":autocmd" etc.

DiffAdd      { fg=green.da(20) };
DiffDelete   { fg=red };
DiffChange   { fg=yellow.da(20) };
DiffText     { DiffChange, gui=un };
DiffAdded    { DiffAdd };
DiffRemoved  { DiffDelete };

SpellBad     { fg=red,     gui=un };
SpellCap     { fg=magenta, gui=un };
SpellLocal   { fg=orange,  gui=un };
SpellRare    { fg=yellow,  gui=un };



---- Language Server Protocol highlight groups ---------------------------------

LspReferenceText                  { bg=mid };    -- highlighting "text" references
LspReferenceRead                  { bg=mid };    -- highlighting "read" references
LspReferenceWrite                 { bg=mid };    -- highlighting "write" references

-- base highlight groups. Other LspDiagnostic highlights link to these by default (except Underline)
LspDiagnosticsDefaultError           { fg=red };
LspDiagnosticsDefaultWarning         { fg=yellow };
LspDiagnosticsDefaultInformation     { fg=fg };
LspDiagnosticsDefaultHint            { fg=teal };

--LspDiagnosticsVirtualTextError       { };    -- "Error" diagnostic virtual text
--LspDiagnosticsVirtualTextWarning     { };    -- "Warning" diagnostic virtual text
--LspDiagnosticsVirtualTextInformation { };    -- "Information" diagnostic virtual text
--LspDiagnosticsVirtualTextHint        { };    -- "Hint" diagnostic virtual text
LspDiagnosticsUnderlineError         { gui=un };    -- underline "Error" diagnostics
LspDiagnosticsUnderlineWarning       { gui=un };    -- underline "Warning" diagnostics
LspDiagnosticsUnderlineInformation   { gui=un };    -- underline "Information" diagnostics
LspDiagnosticsUnderlineHint          { gui=un };    -- underline "Hint" diagnostics
--LspDiagnosticsFloatingError          { };    -- color "Error" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingWarning        { };    -- color "Warning" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingInformation    { };    -- color "Information" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingHint           { };    -- color "Hint" diagnostic messages in diagnostics float
--LspDiagnosticsSignError              { };    -- "Error" signs in sign column
--LspDiagnosticsSignWarning            { };    -- "Warning" signs in sign column
--LspDiagnosticsSignInformation        { };    -- "Information" signs in sign column
--LspDiagnosticsSignHint               { };    -- "Hint" signs in sign column



---- Standard highlight groups -------------------------------------------------
-- See :help group-name

Constant       { fg=orange };
Number         { fg=blue };
Float          { Number };
Boolean        { Constant };
Character      { fg=orange };
String         { fg=green };

Identifier     { fg=fg };
Function       { fg=yellow };

Statement      { fg=orange }; -- (preferred) any statement
Conditional    { Statement };
Repeat         { Statement };
Label          { Statement };       -- case, default, etc.
Operator       { fg=fg };
Keyword        { Statement };    -- any other keyword
Exception      { fg=red };

PreProc        { fg=orange };    --  generic Preprocessor
Include        { PreProc };    -- preprocessor #include
Define         { PreProc };    -- preprocessor #define
Macro          { PreProc };    -- same as Define
PreCondit      { PreProc };    -- preprocessor #if, #else, #endif, etc.

Type           { fg=fg };
StorageClass   { fg=magenta };    -- static, register, volatile, etc.
Structure      { fg=magenta };    -- struct, union, enum, etc.
Typedef        { Type };

Special        { fg=orange };  -- (preferred) any special symbol
SpecialChar    { Special };    -- special character in a constant
Tag            { fg=yellow };  -- you can use CTRL-] on this
Delimiter      { Special };    -- character that needs attention
SpecialComment { Special };    -- special things inside a comment
Debug          { Special };    -- debugging statements

Underlined { gui = un };
Bold       { gui = bf };
Italic     { gui = it };
Ignore     { fg=faded };           --  left blank, hidden  |hl-Ignore|
Error      { fg=red };             --  any erroneous construct
Todo       { gui=bf };  --  anything that needs extra attention



---- TREESITTER ----------------------------------------------------------------

sym "@constant"                 { Constant };
sym "@constant.builtin"         { Constant,   gui=it };    -- constant that are built in the language: `nil` in Lua.
sym "@constant.macro"           { Constant,   gui=bf };    -- constants that are defined by macros: `NULL` in C.
sym "@number"                   { Number };
sym "@float"                    { Float };
sym "@boolean"                  { Boolean };
sym "@character"                { Character };
sym "@string"                   { String };
sym "@string.regex"             { Character };
sym "@string.escape"            { Character };             -- escape characters within a string
sym "@symbol"                   { fg=green, gui=it };      -- For identifiers referring to symbols or atoms.

sym "@field"                    { fg=purple };
sym "@property"                 { fg=purple };
sym "@parameter"                { fg=fg };
sym "@parameter.reference"      { fg=fg };
sym "@variable"                 { fg=fg };                 -- Any variable name that does not have another highlight
sym "@variable.builtin"         { Constant,      gui=it }; -- Variable names that are defined by the languages like `this` or `self`.

sym "@function"                 { Function };
sym "@function.builtin"         { Function };
sym "@function.macro"           { Function };              -- macro defined fuctions: each `macro_rules` in Rust
sym "@method"                   { Function };
sym "@constructor"              { fg=fg };                 -- For constructor: `{}` in Lua and Java constructors.
sym "@keyword.function"         { Keyword };

sym "@keyword"                  { Keyword };
sym "@conditional"              { Conditional };
sym "@repeat"                   { Repeat };
sym "@label"                    { Label };
sym "@operator"                 { Operator };
sym "@exception"                { Exception };

sym "@namespace"                { PreProc };               -- identifiers referring to modules and namespaces.
sym "@annotation"               { PreProc };               -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
sym "@attribute"                { PreProc };               -- Unstable
sym "@include"                  { PreProc };               -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

sym "@type"                     { Type };
sym "@type.builtin"             { Type,     gui=it };

sym "@punctuation.delimiter"    { Delimiter };             -- delimiters ie: `.`
sym "@punctuation.bracket"      { fg=fg };                 -- brackets and parens.
sym "@punctuation.special"      { Delimiter };             -- special punctutation that does not fall in the catagories before.

sym "@comment"                  { Comment };
sym "@tag"                      { Tag };                   -- Tags like html tag names.
sym "@tag.delimiter"            { Special };               -- Tag delimiter like < > /
sym "@text"                     { fg=fg };
sym "@text.emphasis"            { fg=fg,     gui=it };
sym "@text.underline"           { fg=fg,     gui=un };
sym "@text.strike"              { Comment,   gui=un };
sym "@text.strong"              { fg=fg,     gui=bf };
sym "@text.title"               { fg=orange };             -- Text that is part of a title
sym "@text.literal"             { String };                -- Literal text
sym "@text.uri"                 { fg=green, gui=it };      -- Any URI like a link or email

sym "@error"                    { fg=red };                -- syntax/parser errors.


-- Other stuff
HelpHyperTextJump {fg=yellow};
markdownLinkText {fg=fg};

-- NvimTree
NvimTreeNormal       { bg=treebg, fg=fg };
NvimTreeIndentMarker { fg=hsl(204, 3, 32) };
NvimTreeRootFolder   { fg=folder };
NvimTreeFolderIcon   { fg=folder };
}end)
