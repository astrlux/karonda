local lush = require('lush')
local hsl = lush.hsl

local gs = {
  [0] = hsl(0, 0, 0),
  [1] = hsl(0, 0, 10),
  [2] = hsl(0, 0, 20),
  [3] = hsl(0, 0, 30),
  [4] = hsl(0, 0, 40),
  [5] = hsl(0, 0, 50),
  [6] = hsl(0, 0, 60),
  [7] = hsl(0, 0, 70),
  [8] = hsl(0, 0, 90)
}

local palette = {
  -- purple = hsl(265, 89, 78),
  green = hsl(71, 96, 50),
  pink = hsl(326, 98, 59),
  red = hsl(330, 100, 46),
  background = {
    dark = gs[0],
    medium = gs[1],
    light = gs[2]
  },
  foreground = {
    dark = gs[6],
    medium = gs[7],
    light = gs[8]
  },
  aux = {
    info = hsl(49, 93, 54),
    error = hsl(2, 100, 52),
    warning = hsl(24, 100, 50)
  }
}

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.
    Comment {
      fg = palette.background.light,
      gui = 'italic'
    }, -- any comment
    ColorColumn {
      bg = palette.background.medium
    }, -- used for the columns set with 'colorcolumn'
    Conceal {
      fg = palette.background.medium
    }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor {} -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn {
      bg = palette.background.medium.darken(9)
    }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine {
      bg = gs[1].darken(27)
    }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory {
      fg = palette.foreground.light
    }, -- directory names (and other special names in listings)
    DiffAdd {
      fg = palette.green,
      bg = palette.green.darken(81)
    }, -- diff mode: Added line |diff.txt|
    DiffChange {
      fg = palette.aux.info,
      bg = palette.aux.info.darken(81)
    }, -- diff mode: Changed line |diff.txt|
    DiffDelete {
      fg = palette.aux.error,
      bg = palette.aux.error.darken(81)
    }, -- diff mode: Deleted line |diff.txt|
    DiffText {
      fg = palette.aux.warning,
      bg = palette.aux.warning.darken(81)
    }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer {
      fg = gs[1]
    }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg {
      fg = palette.aux.error,
      bg = palette.aux.warning.darken(81)
    }, -- error messages on the command line
    VertSplit {
      fg = palette.background.dark.lighten(9),
      bg = 'none'
    }, -- the column separating vertically split windows
    Folded {
      bg = gs[2]
    }, -- line used for closed folds
    FoldColumn {
      bg = gs[2]
    }, -- 'foldcolumn'
    SignColumn {}, -- column where |signs| are displayed
    IncSearch {
      fg = palette.green,
      bg = palette.green.darken(81)
    }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute {
      fg = palette.aux.warning,
      bg = palette.aux.warning.darken(81)
    }, -- |:substitute| replacement text highlighting
    LineNr {
      fg = palette.background.light
    }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr {
      fg = palette.foreground.medium
    }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen {
      fg = palette.aux.info,
      gui = 'bold'
    }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg {}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea {}, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg {
      fg = palette.light_green
    }, -- |more-prompt|
    NonText {
      fg = palette.foreground.dark.darken(36)
    }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal {
      fg = palette.foreground.light
    }, -- normal text
    NormalFloat {
      fg = palette.foreground.light
    }, -- Normal text in floating windows.
    NormalNC {
      fg = palette.foreground.light
    }, -- normal text in non-current windows
    Pmenu {
      bg = gs[1],
      fg = palette.foreground.light
    }, -- Popup menu: normal item.
    PmenuSel {
      fg = palette.background.dark,
      bg = palette.foreground.light
    }, -- Popup menu: selected item.
    PmenuSbar {
      bg = gs[2]
    }, -- Popup menu: scrollbar.
    PmenuThumb {
      bg = gs[7]
    }, -- Popup menu: Thumb of the scrollbar.
    Question {
      fg = palette.foreground.light
    }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine {
      fg = palette.pink,
      bg = palette.pink.darken(80)
    }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search {
      fg = palette.pink,
      bg = palette.pink.darken(80)
    }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey {
      fg = palette.background.medium
    }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad {
      gui = 'underline',
      fg = palette.aux.error
    }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap {
      fg = palette.aux.info,
      gui = 'underline'
    }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title {
      fg = palette.pink
    }, -- titles for output from ":set all", ":autocmd" etc.
    Visual {
      fg = palette.background.dark,
      bg = palette.foreground.light
    }, -- Visual mode selection
    VisualNOS {
      fg = palette.background.light,
      bg = palette.foreground.dark
    }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg {
      fg = palette.aux.warning
    }, -- warning messages
    Whitespace {
      fg = palette.background.medium
    }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.
    Constant {
      fg = palette.pink
    }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10
    Identifier {
      fg = palette.foreground.dark
    }, -- (preferred) any variable name
    Function {
      fg = palette.green
    }, -- function name (also: methods for classes)
    Statement {
      fg = palette.foreground.medium
    }, -- (preferred) any statement
    Conditional {
      fg = palette.red
    }, --  if, then, else, endif, switch, etc.
    Repeat {
      fg = palette.red
    }, --   for, do, while, etc.
    -- Label {}, --    case, default, etc.
    Operator {
      fg = gs[3]
    }, -- "sizeof", "+", "*", etc.
    Keyword {
      fg = palette.foreground.dark
    }, --  any other keyword
    Exception {
      fg = gs[7]
    }, --  try, catch, throw
    PreProc {
      fg = gs[4]
    }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.
    Type {
      fg = palette.green
    }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef
    Special {
      fg = gs[3]
    }, -- (preferred) any special symbol
    SpecialChar {
      gui = 'bold',
      fg = palette.aux.info
    }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter {
      fg = gs[8]
    }, --  character that needs attention
    SpecialComment {
      fg = palette.aux.info,
      bg = palette.aux.info.darken(81)
    }, -- special things inside a comment
    Debug {
      fg = gs[8]
    }, --  debugging statements
    Underlined {
      gui = 'underline'
    }, -- (preferred) text that stands out, HTML links
    Bold {
      gui = 'bold'
    }, -- bold text
    Italic {
      gui = 'italic'
    }, -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error {
      fg = palette.aux.error,
      bg = palette.aux.error.darken(81)
    }, -- (preferred) any erroneous construct
    Todo {
      gui = 'bold',
      fg = palette.aux.info,
      bg = palette.aux.info.darken(81)
    }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    LspFloatWinBorder {
      fg = gs[8],
      bg = 'none'
    },

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError {
      fg = palette.aux.error
    }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn {
      fg = palette.aux.warning
    }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo {
      fg = palette.aux.info
    }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    -- TSKeyword            { } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn {
      fg = palette.red
    }, -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket {
      fg = palette.foreground.medium
    }, -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    TSStrong {
      gui = 'bold'
    }, -- Text to be represented in bold.
    TSEmphasis {
      gui = 'italic'
    }, -- Text to be represented with emphasis.
    TSUnderline {
      gui = 'underline'
    }, -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.
    --
    --
    -- PLUGIN: hrsh7th/nvim-cmp
    -- reference: https://www.github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    CmpItemAbbrDeprecated {
      gui = 'strikethrough',
      fg = palette.aux.error
    }, -- deprecated completeopts
    CmpItemAbbrMatch {
      fg = palette.red
    }, -- exact matches
    CmpItemAbbrMatchFuzzy {
      fg = palette.pink
    }, -- fuzzy matches
    --
    --
    -- PLUGIN: nvim-telescope/telescope.nvim
    -- reference: telescope.builtin.highlights
    TelescopeNormal {
      fg = palette.foreground.dark
    }, -- regular text and colors
    TelescopeMatching {
      fg = palette.pink,
      bg = 'none',
      gui = 'bold'
    }, -- fuzzy matches
    TelescopeSelection {
      fg = palette.foreground.light
    }
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
