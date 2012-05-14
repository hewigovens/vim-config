set nu
set langmenu=en_US
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,longest,preview
set ignorecase
set smartcase
set incsearch
set hlsearch
set showcmd
set noerrorbells
set report=0
set showmatch
set backup

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}


call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
au FileType python set omnifunc=pythoncomplete#Complete

"{fugitive#statusline()}
let g:SuperTabDefaultCompletionType = "context"
let $LANG = 'en_US'
let g:pyflaskes_use_quickfix = 0
let g:pep8_map='<leader>8'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
