"" ===============
"  Mappings
"" ===============
  " Disable Q (Command Shell Mode)
  " ------------------------------
      nnoremap Q <nop>
      nnoremap gq <nop>
      nnoremap q: <nop>

  " * No longer moves the cursor when hitting it the first time
  " -----------------------------------------------------------
      nmap * *Nzz
      nmap # #Nzz

  " Y y$ Fix
  " --------
      " Why the hell isn't this the normal behavior?
      nnoremap Y y$

  " Easy Window Switching
  " ---------------------
  " Switch window mappings
      nnoremap <C-Left> <C-w>h
      nnoremap <C-Down> <C-w>j
      nnoremap <C-Up> <C-w>k
      nnoremap <C-Right> <C-w>l

  " Space folds and unfolds
  " -----------------------
      nnoremap <Space> za
      vnoremap <Space> za

  " Zencoding
  " ---------
      let g:user_zen_leader_key='<c-e>'
      let g:use_zen_complete_tag = 1

  " Markdown Preview Toggle
  " ------------
      nmap <F7> :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>

  " Misc
  " ----
      imap jj <Esc>:redraw!<CR>:syntax sync fromstart<CR>

  " Vimrc Toggle
  " ------------
      function! ToggleVimrc()
          if expand("%:p") =~ $MYVIMRC
              :bd
          else
              :vsp $MYVIMRC
          endif
      endfunction
      nmap <leader>v :call ToggleVimrc()<CR>

  " NERDTreeToggle
    " --------------
    function! NERDTreeToggleOrFocus()
        if expand("%") =~ "NERD_tree"
            :NERDTreeToggle
        else
            call NERDTreeFocus()
        endif
    endfunction
        nmap <leader>n :call NERDTreeToggleOrFocus()<CR>

    " Quickfix list nav with C-n and C-m
    " ----------------------------------
        map <C-n> :cn<CR>
        map <C-m> :cp<CR>

    " Format JSON with python
    " -----------------------
        map <Leader>j !python -m json.tool<CR>

    " Multipurpose Tab-key
    " --------------------
    " Taken from https://github.com/gregstallings/vimfiles/blob/master/vimrc
        " Indent if at the beginning of a line, else do completion
        function! InsertTabWrapper()
            let col = col('.') - 1
            if !col || getline('.')[col - 1] !~ '\k'
                return "\<tab>"
            else
                if CanExpandSnippet() > 0
                    return "\<C-r>=TriggerSnippet()\<cr>"
                else
                    return "\<c-p>"
                endif
            endif
        endfunction
        "inoremap <tab> <c-r>=InsertTabWrapper()<cr>
        "inoremap <s-tab> <c-n>
        "inoremap <c-c> <C-r>=TriggerSnippet()<cr>

    " Toggle Paste/No Paste
    " --------------------
        function! TogglePaste()
            if &paste
                :set nopaste
            else
                :set paste
            endif
        endfunction
        nmap <leader>p :call TogglePaste()<CR>
