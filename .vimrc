"load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"Basic
set nocompatible
set laststatus=2
set nu
set langmenu=en_US
set noerrorbells
set cursorline

"Statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set wildmenu
set wildmode=longest,list,full

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
" set spell
set nowrap

"File
set autoread
set autowrite
set hidden
set backup

"Undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"GUI
"set mouse=a

"Mapping
imap jj <Esc>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>mg :call MakeGreen()<CR>
nmap <leader>a <Esc>:Ack!
nmap <F8> :TagbarToggle<CR>

colorscheme desert
syntax on
filetype on 
filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "context"
let g:pyflaskes_use_quickfix = 0
let g:pep8_map='<leader>8'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd VimEnter * wincmd 1
