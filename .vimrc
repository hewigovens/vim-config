"load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"Basic
set nocompatible
set nu
set langmenu=en_US
set noerrorbells
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set cursorline

"Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent

"Fold
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,longest,preview

"Search 
set ignorecase
set smartcase
set incsearch
set hlsearch

"Edit
set showcmd
set showmode
set showmatch
set linebreak
set report=0
set encoding=utf-8

"File
set autoread
set autowrite
set hidden
set backup

"GUI
"set mouse=a

"Mapping
imap jj <Esc>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>mg :call MakeGreen()<CR>
nmap <leader>a <Esc>:Ack!

colorscheme desert
syntax on
filetype on 
filetype plugin indent on

let g:SuperTabDefaultCompletionType = "context"
let g:pyflaskes_use_quickfix = 0
let g:pep8_map='<leader>8'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd VimEnter * NERDTree
