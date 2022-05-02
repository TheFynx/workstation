"" ===============
"  Plugin Settings
"" ===============
  " Airline Settings
  " ----------------
    let g:airline#extensions#tabline#enabled = 1
    set laststatus=2
    let g:bufferline_echo = 0
    let g:airline_theme = 'distinguished'
    let g:airline_powerline_fonts = 1

  " Markdown Settings
  " ----------------
    let g:vim_markdown_folding_disabled = 1

  " Vim Session Persist
  " -------------------
    let g:session_autosave = 1
    let g:session_autoload = 1

  " NERDTree
  " --------
    " General properties
    let g:NERDTreeDirArrows=1
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
    let g:NERDTreeWinSize = 35

    " Make sure that when NT root is changed, Vim's pwd is also updated
    let g:NERDTreeChDirMode = 2
    let g:NERDTreeShowLineNumbers = 1
    let g:NERDTreeAutoCenter = 1

    " Open NERDTree on startup, when no file has been specified
    autocmd VimEnter * if !argc() | NERDTree | endif

  " Python Mode Settings
  " --------------------
    let g:pymode_lint_checker = "pyflakes,pep8"
    let g:pymode_lint_onfly = 0
    let g:pymode_folding = 0
    let g:pymode_rope_complete_on_dot = 0

  " Syntastic
  " ----------
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

  " Vim-go
  " --------
    let g:go_fmt_fail_silently = 1
    let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

    let g:go_list_type = "quickfix"

    " Show a list of interfaces which is implemented by the type under your cursor
    au FileType go nmap <Leader>s <Plug>(go-implements)

    " Show type info for the word under your cursor
    au FileType go nmap <Leader>i <Plug>(go-info)

    " Open the relevant Godoc for the word under the cursor
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

    " Open the Godoc in browser
    au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

    " Run/build/test/coverage
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)

    " By default syntax-highlighting for Functions, Methods and Structs is disabled.
    " Let's enable them!
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1

    nmap <F8> :TagbarToggle<CR>
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
