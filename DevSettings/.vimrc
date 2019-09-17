execute pathogen#infect()

set nu
syntax on
filetype plugin on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set laststatus=2
set showtabline=2
set hidden
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme desert
set expandtab

"Settings below are critical for vim when running under tmux
set background=dark
set t_Co=256


nmap <C-E> :NERDTreeToggle<CR>
map gn :bn<CR>
map gp :bp<CR>

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
