" PROJECT:	nvim
" FILE:		config/stab.vim
" AUTHOR:   rassil0n
" MAIL:		rassil0n@protonmail.com
" GIT:		https://github.com/rassil0n

" Original found here:
" http://vimcasts.org/episodes/tabs-and-spaces/

"{{{ Stab
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
	let &l:sts = l:tabstop
	let &l:ts = l:tabstop
	let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
"}}}
"{{{ SummarizeTabs
function! SummarizeTabs()
  try
	echohl ModeMsg
	echon 'tabstop='.&l:ts
	echon ' shiftwidth='.&l:sw
	echon ' softtabstop='.&l:sts
	if &l:et
	  echon ' expandtab'
	else
	  echon ' noexpandtab'
	endif
  finally
	echohl None
  endtry
endfunction
"}}}

" vim:foldmethod=marker:foldlevel=0
