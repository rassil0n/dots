" PROJECT:	nvim
" FILE:		config/netrw.vim
" AUTHOR:   rassil0n
" MAIL:		rassil0n@protonmail.com
" GIT:		https://github.com/rassil0n

"{{{ General Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_liststyle = 1
"}}}
"{{{ OpenToRight
function! OpenToRight()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'belowright vnew' g:path
  :normal <C-l>
endfunction
"}}}
"{{{ OpenBelow
function! OpenBelow()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'belowright new' g:path
  :normal <C-l>
endfunction
"}}}
"{{{ OpenTab
function! OpenTab()
  :normal v
  let g:path=expand('%:p')
  :q!
  :normal <C-l>
  execute 'tabedit' g:path
endfunction
"}}}
"{{{ NetrwMappings
function! NetrwMappings()
    " Hack fix to make ctrl-l work properly
    noremap <buffer> <C-l> <C-w>l
    noremap <silent> <F2> :call ToggleNetrw()<CR>
    noremap <buffer> V :call OpenToRight()<cr>
    noremap <buffer> H :call OpenBelow()<cr>
    noremap <buffer> T :call OpenTab()<cr>
endfunction

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END
"}}}
"{{{ ToggleNetrw
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
"}}}

let g:NetrwIsOpen=0

"{{{ NOT USED
" Close Netrw if it's the only buffer open
" autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Make netrw act like a project Draw
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :call ToggleNetrw()
" augroup END
" }}}
" vim:foldmethod=marker:foldlevel=0
