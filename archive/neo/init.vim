"" ==============
"  Initialization
"" ==============
  " Assume a dark background
  set background=dark

  " Let Vim look for settings in a file
  set modeline
  set modelines=5

  " If vimrc has been modified, re-source it for fast modifications
  autocmd! BufWritePost *vimrc source %

  " Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif

  "" ==============
  "  Vundle Bundles
  "" ==============
    " Required Plugins
    Bundle 'gmarik/vundle'

    " Function Bundles
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-git'
    Bundle 'godlygeek/tabular'
    Bundle 'garbas/vim-snipmate'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'tpope/vim-pathogen'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'

    " Syntax/Language Bundles
    Bundle 'plasticboy/vim-markdown'
    Bundle 'saltstack/salt-vim'
    Bundle 'Glench/Vim-Jinja2-Syntax'
    Bundle 'PProvost/vim-ps1'
    Bundle 'ekalinin/Dockerfile.vim'
    Bundle 'pangloss/vim-javascript'
    Bundle 'tpope/vim-haml'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'fatih/vim-go'

    " Appearance Bundles
    Bundle 'flazz/vim-colorschemes'
    Bundle 'bling/vim-airline'
    Bundle 'bling/vim-bufferline'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'scrooloose/syntastic'
    Bundle 'myusuf3/numbers.vim'
    Bundle 'vim-airline/vim-airline-themes'

    filetype plugin indent on

" Set Leader
let mapleader = ","

" Wildmode options
" ----------------
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.bmp
set wildignore+=*.hg,*.git,*.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.pyc
set wildignore+=*.DS_Store
