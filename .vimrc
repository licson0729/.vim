" Setting up NeoBundle - the vim plugin bundler
set nocompatible               " Be iMproved

" NeoBundle check and auto install
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
" vim-scripts repos
NeoBundle 'closetag.vim'


" Pcc's new plugins
" 一種亂加的概念
NeoBundle 'ervandew/supertab'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'shawncplus/phpcomplete.vim'


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

call neobundle#end()

NeoBundleCheck

" Global settings
set nu
set ai
set tabstop=4
set shiftwidth=4
set expandtab
set ic
set modeline
set incsearch
set cursorline
set showcmd
set history=1000
set encoding=utf-8
set wildmode=longest,list,full

" map Ctel-L to be nohl, clear search highlight
nnoremap <c-l> :nohl<cr>

" close tag
let g:closetag_html_style=1
source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType gitcommit setlocal spell

" powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

