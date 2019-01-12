"~~~~~~~~~~~~~~~~~
" SETTINGS:
"~~~~~~~~~~~~~~~~~
" Basic:
filetype plugin on
set encoding=utf-8
set autoread
set clipboard=unnamedplus
set mouse=a
set title
autocmd BufWritePre * %s/\s\+$//e
set splitbelow
set noswapfile
set noerrorbells
set nowrap
set nospell
if has("autocmd") " Remember curser position in files
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Editor:
set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set list
set listchars=tab:\|\ ,trail:▫

" Visual:
set t_Co=256
syntax enable
try
    colorscheme dracula
catch
endtry
"set cursorline
set ruler
set foldcolumn=4
highlight FoldColumn ctermbg=none
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Search:
set incsearch
set hlsearch
if has('nvim')
    set inccommand=split
endif


"~~~~~~~~~~~~~~~~~~~~~~~
" KEY BINDINGS:
"~~~~~~~~~~~~~~~~~~~~~~~

" Sane Splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Typo
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Search
map <leader>c :nohlsearch<cr>
nnoremap n nzzzv
nnoremap N Nzzzv

