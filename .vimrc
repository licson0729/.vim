colorscheme default

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
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
" vim-scripts repos
NeoBundle 'closetag.vim'

NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"


" Pcc's new plugins
" 一種亂加的概念
"NeoBundle 'ervandew/supertab'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'vim-scripts/argtextobj.vim'
"NeoBundle 'kana/vim-textobj-line'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'wellle/targets.vim'
NeoBundle 'othree/vim-autocomplpop'
NeoBundle 'vim-scripts/L9'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'ervandew/supertab'
NeoBundle 'rkulla/pydiction'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'greyblake/vim-preview'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'fisadev/vim-isort'

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


autocmd BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md set filetype=markdown
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit,markdown set dictionary+=/usr/share/dict/words
autocmd FileType gitcommit,markdown set linebreak

" Solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" GitGutter
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" NERDTree Tab
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" Paste mode
set pastetoggle=<F10>

" Tab navigation keybinds
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Completions
filetype plugin on
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward = "<s-tab>"
inoremap <c-e> <c-x><c-k>
inoremap <c-l> <c-x><c-l>
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xhtml,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
let g:pydiction_location = "~/.vim/bundle/pydiction/complete-dict"


" select ALL
map <C-A> ggVG

" preview
nnoremap <F12>f :exe ':silent !firefox %'<CR>
