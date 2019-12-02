execute pathogen#infect()

set nu
syntax on
filetype plugin on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set laststatus=2
set showtabline=2
set hidden
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme desert
set expandtab

"Settings below are critical for vim when running under tmux
set background=light
set t_Co=256
set cursorline

nmap <C-E> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
map gn :bn<CR>
map gp :bp<CR>

let g:airline#extensions#bufferline#overwrite_variables=0
let g:bufferline_fixed_index = -2
let g:NERDTreeWinSize=60
"let g:bufferline_rotate = 1

"fzf binds
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :Rg<CR>

nmap <F8> :TagbarToggle<CR>
nnoremap <F10> :call ColorschemeGoDark()<CR>

function! ColorschemeGoDark()
  colorscheme codedark
  set background=dark
endfunction

"function! Osc52Yank()
"let buffer=system('base64 -w0', @0)
"let buffer=substitute(buffer, "\n$", "", "")
"let buffer='\e]52;c;'.buffer.'\x07'
"silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/tty")
"endfunction
"
"nnoremap <C-Y>y :call Osc52Yank()<CR>

"command! Osc52CopyYank call Osc52Yank()
"augroup Example
"  autocmd!
"  autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
"augroup END

" air-line
" let g:airline_powerline_fonts = 1
"
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
"     endif
"
