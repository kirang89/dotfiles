syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4        " Set indent to 4 spaces
set expandtab
set textwidth=100
set t_Co=256
set number
set autoread           "Reload files changed outside vim
set showmatch
set incsearch
set hlsearch

set noswapfile
set nobackup
set nowb

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim