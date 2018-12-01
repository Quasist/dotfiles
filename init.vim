" (_)_ __ (_) |___   _(_)_ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
 
" ==================== VIM PLUG ==================

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes ''
 
" autocomplete - deoplete 
"Plug 'Rip-Rip/clang_complete'

" autocompletion (also a linter - diagnostics)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" autocomplete - roxma
"Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/ncm-clang'
 
" ale - linter / autocompletion / formatter
Plug 'w0rp/ale'

" auto formatter
Plug 'rhysd/vim-clang-format'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" surround vim
Plug 'tpope/vim-surround'



" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" A - for switching between source and header files
Plug 'vim-scripts/a.vim'

" colorscheme
"Plug 'wombat256mod.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-vividchalk'
Plug 'lokaltog/vim-distinguished'
Plug 'kamwitsta/nordisk'
Plug 'arcticicestudio/nord-vim'
call plug#end()			


" ================ Suggestions ======================
 
" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd


" ================ File management ==================
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
 
" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Srolling =========================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8

 
" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif


" ================ Keyboard bindings ================
 
" noremap - no recursive mapping

" set the leader key to comma
let mapleader = ','

" ================ Visualization ====================
 
" set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let nord_comment_brightness = 15
let nord_italic = 1
let nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
syntax on
set background=dark
colorscheme nord

" enable 256bit colors - also: override gnome-terminal's settings
" set t_Co=256
" ================ Indentation ======================

filetype on
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab


" ================ Number column ====================
 
" numbers
set number " see the line number column


" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10



" ================ Misc =============================


" When the last window will have a status line (2 = always)
set laststatus=2

" disable wrapping of long lines into multiple lines
set nowrap

" history
set history=1000

" to avoid hitting:
" 'press ENTER or type command to continue'
" add 'silent' keyword before the command
" 
" open a gnome-terminal with a shortcut
noremap <leader><CR> :silent !gnome-terminal<CR>

"disable preview window
set completeopt-=preview


" ################ NERDTree #########################
 
" shift+i (show hidden files)
autocmd StdinReadPre * let s:std_in=1
" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ################ Clang complete ###################

"let g:clang_use_library = 1
"let g:clang_library_path='/usr/lib/llvm-5.0/lib/libclang.so.1'
"let g:clang_periodic_quickfix=1
"let g:clang_auto_select = 1

"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'ultisnips'



" ################ YouCompleteMe ####################

let g:ycm_show_diagnostics_ui = 0

let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-l>', '<Up>']
let g:SuperTabDefaulCompletionType = '<C-k>'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" disable annoying ycm confirmation
let g:ycm_confirm_extra_conf = 0

 
" ################ Ale ##############################
 
" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++-5.0'

" linter
 let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++1z -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'


" ################ Clang format #####################
 
" Clang format - auto formatting
 
let g:clang_format#command = 'clang-format-3.8'
let g:clang_format#style_options = {
            \ "BreakBeforeBraces" : "Attach",
            \ "UseTab" : "Never",
            \ "IndentWidth" : 4,
            \ "ColumnLimit" : 100,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \}
autocmd FileType c,cpp,h,hpp ClangFormatAutoEnable



