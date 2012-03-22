set nu
set langmenu=en_US
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,longest,preview

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

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

%{fugitive#statusline()}
let g:SuperTabDefaultCompletionType = "context"
let $LANG = 'en_US'
let g:pyflaskes_use_quickfix = 0
let g:pep8_map='<leader>8'

