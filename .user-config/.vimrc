" automatically leave insert mode after 'updatetime' milliseconds of inaction
" au CursorHoldI * stopinsert

" set 'updatetime' to 15 seconds when in insert mode
" au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
" au InsertLeave * let &updatetime=updaterestore

" when you have error about dos line ending (clue here is ^M)
" most likely your file has line ending with dos
" to check the file type  :set ff?
set ff=unix "set fileformat=unix

" Start Config
set nocompatible        " be iMproved, required
filetype off            " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'itchyny/lightline.vim'
Plugin 'elmcast/elm-vim'
" Plugin 'mattn/emmet-vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
" Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'pangloss/vim-javascript'
" Plugin 'OmniSharp/omnisharp-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" End Config

" fix for js no rainbow parentheses
" src: https://github.com/pangloss/vim-javascript/issues/184
autocmd FileType javascript syntax clear jsFuncBlock

" kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

if !exists("g:syntax_on")
      syntax enable
endif

" Enable 256 colors palette
" in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

try
  colorscheme desert
catch
endtry

" set background=dark

" Set extra options when
" running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

set encoding=utf-8

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros
" (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when
" text indicator is over them
set showmatch

" How many tenths of a second to blink
" when matching brackets
set mat=5

" Show all whitespaces
" set listchars=tab:→\ ,space:·,trail:·,precedes:«,extends:»,eol:↲
set listchars=tab:→\ ,trail:·
set list
" set list!


set history=500
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set path+=**
set wildmenu
set so=7
set laststatus=2
set hlsearch
set incsearch
set showcmd
" set number relativenumber
set number
set autoindent
set smartindent
set wrap


let g:lightline = {
        \ 'active': {
        \ },
        \ 'component': {
        \   'lineinfo': "%{line('.') . '/' . line('$')}",
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' },
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'relativepath', 'modified' ],
      \           [ 'lineinfo', 'percent' ] ],
      \ 'right': [ [ ] ]
      \}

let g:lightline.inactive = {
      \ 'right': [ ]
      \}

" Plugin jamshedvesuna/vim-markdown-preview
let vim_markdown_preview_github=1

" Remember code folding
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" select and copy manually with mouse.
set mouse=a

" cursor switcher insert/normal mode:
" :autocmd InsertEnter,InsertLeave * set cul!
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

" copy to clipboard
" set clipboard=unnamed

" execute a shell command:
" :! ls -la

" Redefine trigger key for emmet
" that means it will trigger
" when you press comma (twice)
" Default state is <C-y> with comma
" let g:user_emmet_leader_key='<,>'

" copy cut paste from system clipboard
" ---->  "+y
" ---->  "+p
