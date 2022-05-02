"" ===============
"  General Settings
"" ===============
  " Clear Autocommands
  autocmd!

  " If you can't spell, tough.
  set nospell

  " Fix weird symbols
  set guicursor=

"" ==============
"  Filetype Association
"" ===============
  au BufRead,BufNewFile *vimrc set foldmethod=marker

  augroup RubySyntaxFiles
      autocmd! BufRead,BufEnter *.rb,*.rake set tabstop=2 sts=2 shiftwidth=2 filetype=ruby
      autocmd! BufEnter Rakefile set filetype=ruby
      autocmd! BufEnter Gemfile set filetype=ruby
  augroup end

  augroup Chef
      autocmd FileType ruby,eruby set filetype=ruby.eruby.chef
  augroup end

  augroup MarkdownFiles " Instead of this Modulo file bullshit
      autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  augroup end

  au BufWritePost ~/.bashrc !source %

  au BufRead,BufNewFile *_spec.rb nmap <F8> :!rspec --color %<CR>

  augroup PatchDiffHighlight
      autocmd!
      autocmd BufEnter *.patch,*.rej,*.diff syntax enable
  augroup end

"" ===============
"  Look and Feel
"" ===============
  " Basics / Misc
  " -------------
    " Let netrw show things in a tree structure instead of a flat list
    "let g:netrw_liststyle=3

    " Used for saving git and hg commits
    filetype on
    filetype off

    " Set to allow you to backspace while back past insert mode
    set backspace=2

    " Disable mouse
    set mouse=

    " Increase History
    set history=100

    " Enable numbers in the left column
    set number

    " Give context to where the cursor is positioned in a file
    set scrolloff=14

    " Use UTF-8 encoding
    set encoding=utf-8 nobomb

    " Hide buffers after they are abandoned
    set hidden

    " Disable files that don't need to be created
    set noswapfile
    set nobackup
    set nowb

    " Auto Complete Menu
    set completeopt=longest,menu

  " Tabbing and Spaces
  " ------------------
    " Use 4 spaces instead of tabs
    set ts=2
    set sts=2
    set shiftwidth=2
    set expandtab

    " Auto indent
    set autoindent

    " replace trailing whitespace and tabs with unicode characters
    exec "set listchars=tab:\uBB\uBB,trail:\u2716,nbsp:~"
    set list

  " Color Settings
  " --------------
    " Enable syntax highlighting
    syntax enable

    " Set font and color scheme for Gvim
    set guifont=Inconsolata\ for\ Powerline:h14
    if has("gui_running")
        if has("gui_win32")
            set guifont=Consolas:h10:cANSI
        endif
    else
        set t_Co=256
    endif
    try
        colorscheme badwolf
    catch
        colorscheme darkzen
    endtry

  " Persistent Undo
  " ---------------
      if v:version >= 703
          set undofile
          set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
      endif
  " }}}
  " Spelling / Typos {{{2
  " ----------------
      :command! WQ wq
      :command! Wq wq
      :command! W w
      :command! Q q
  " }}}
  " Open file and goto previous location {{{2
  " ------------------------------------
      autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                 \|     exe "normal! g`\""
                 \|  endif
