set nocompatible                                    " latest Vim settings & options

so ~/.vim/plugins.vim

syntax enable
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

:hi TabLine ctermfg=235 ctermbg=DarkGrey
:hi TabLineSel ctermfg=49 ctermbg=none
:hi TabLineFill term=bold cterm=bold ctermbg=none

set guioptions-=                                    " remove scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e                                   " don't show gui tabs

set showmode                                        " always show what mode we're currently editing in
set nowrap                                          " don't wrap lines
set tabstop=4                                       " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4                                   " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                                       " expand tabs by default (overloadable per file type later)
set shiftwidth=4                                    " number of spaces to use for autoindenting
set shiftround                                      " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start                      " allow backspacing over everything in insert mode
set autoindent                                      " always set autoindenting on
set copyindent                                      " copy the previous indentation on autoindenting
set number                                          " always show line numbers
set ignorecase                                      " ignore case when searching
set smartcase                                       " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set noerrorbells visualbell t_vb=                   " don't beep
set autowrite                                       " Save on buffer switch
set nobackup
set noswapfile
set mouse=a
set linespace=6
set encoding=utf-8
if has('gui_running')
  set guifont=Monaco\ for\ Powerline:h13
  set fullscreen
endif
set nofoldenable                                    " prevent folds
set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
set gcr=a:blinkon0
set hlsearch
set incsearch

"-------General Mappings---------"

" set deafult leader to comma
let mapleader= ','

" imap : mapping for insert mode
imap jj <esc>

" disable search highlighting
nmap <Leader><space> :nohlsearch<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Window nav
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

" make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" make it easy to edit plugins file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" make it easy to laravel make (command line)
nmap <Leader>lm :!php artisan make:

" make it easy to edit laravel snippets file
nmap <Leader>els :tabedit /Users/robb/.vim/snippets/laravel.snippets<cr>


"------------Plugins------------"

" nerdtree
let NERDTreeHijackNetrw=0

" make NERDTree easier to toggle
nmap <leader>1 :NERDTreeToggle<cr>

" ctags
nmap <Leader>f :tag<space>

" Ctrl P
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window ='top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_show_hidden = 1

" PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

" Ultrasnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1


"-------------Auto-Commands--------------"

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" import namespaces
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

autocmd FileType php set ft=php.laravel
autocmd FileType php set ft=php.blade

