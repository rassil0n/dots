" PROJECT:	nvim
" FILE:		config/keymaps.vim
" AUTHOR:	rassil0n
" MAIL:		rassil0n@protonmail.com
" GIT:		https://github.com/rassil0n

" {{{LEADERKEY
	let mapleader =" "
"}}}
"{{{ DOC_COMPILER
	inoremap <F5> <Esc>:w<Cr>:!doc_compiler -c <C-r>%<Cr>
	inoremap ;C <Esc>:w<Cr>:!doc_compiler -c <C-r>%<Cr>
	map <F5> :w<Cr>:!doc_compiler -c <C-r>%<Cr>
	map ;C :w<Cr>:!doc_compiler -c <C-r>%<Cr>
	autocmd FileType tex map <F5> :w<Cr>:tabfind Main.tex<Cr>:!doc_compiler <C-r>%<Cr>:tabclose
	autocmd FileType tex map ;C :w<Cr>:sfind Main.tex<Cr>:!doc_compiler -c <C-r>%<Cr>:close
	autocmd FileType groff map <F5> :w<Cr>:tabfind main.ms<Cr>:!doc_compiler -c <C-r>%<Cr>:tabclose
	autocmd FileType groff map ;C :w<Cr>:tabfind main.ms<Cr>:!doc_compiler -c <C-r>%<Cr>:tabclose
"}}}
"{{{ DOC_PREVIEW
	inoremap <F4> <Esc>:w<Cr>:!doc_compiler -p <C-r>% &<Cr><Cr>
	map <F4> :w<Cr>:!doc_compiler -p <C-r>%<Cr><Cr>
"}}}
"{{{ SPELLCHECK
	map <F7> :setlocal spell! spelllang=de_de<Cr>
"}}}
"{{{ TABING
	nmap <Tab> gt
	nmap <S-Tab> gT
	nmap gf <C-w>gf
"}}}
"{{{ SPLITVIEWS
	map <leader>s :split<Space>
	map <leader>v :vsplit<Space>
	nmap - <C-w>-
	nmap + <C-w>+
"}}}
"{{{ COPY/PASTE
	map Y y$
	map cy cp
"}}}
"{{{ TOGGLE SETTINGS
	map <leader>h :set hls!<Cr>
	map <leader>l :set cursorline!<Cr>
	map <leader>z :set foldenable!<Cr>
"}}}
"{{{ PLACEHOLDER (<++>)
	map <space><tab> <Esc>/<++><Enter>ca<
	inoremap <space><tab> <Esc>/<++><Enter>ca<
	vnoremap <space><tab> <Esc>/<++><Enter>ca<
"}}}
"{{{ BRACKETS
	inoremap {<CR> {<CR>}<c-o><s-o>
	inoremap (<CR> (<CR>)<c-o><s-o>
	inoremap [<CR> [<CR>]<c-o><s-o>
	" inoremap        (  ()<Left>
	" inoremap        {  {}<Left>
	" inoremap        [  []<Left>
"}}}
"{{{ AUTO SKIP
	inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
	inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
	inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
	inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"}}}
"{{{ SOURCE KEYMAPS FOR FILETYPES
	autocmd FileType markdown source ~/.config/nvim/extra/keys/markdown.vim
	autocmd FileType tex source ~/.config/nvim/extra/keys/latex.vim
"}}}
"{{{ MISC
nmap <C-g> :echo expand('%:p')<Cr>
cnoreabbr <expr> %% fnameescape(expand('%:p'))
map <F10> :execute "Rg " . expand("<cword>") <CR>
nmap <expr> <CR> &buftype ==# '' ? 'za' : "\<CR>"
map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<Cr>
map gf :e <cfile><CR>

" vmap <Tab> :!vilatac<Cr>a<C-j>
" vmap <C-j> :!vilatac<Cr>a<C-j>
"}}}
"{{{ NOT USED
" map <leader>f :Filetypes<Cr>
" map <leader>b :Buffers<Cr>
" map <leader>b :ls<Cr>:
" map <C-b> :b <C-d>*
" map <leader>m :Marks<Cr>
" map <leader>o :FZF<Enter>
" map <leader>c :Calendar<Enter>
" map <leader>r :Renamer<Enter>
" map <leader>V :vsplit<Cr><c-w>l:term<Cr>
" map <leader>S :split<Cr><c-w>j:term<Cr>
" map <leader>T :tabedit<Cr>:term<Cr>
" map <leader>t :tabedit<Space>
" map <leader>t :LfCurrentDirectoryExistingOrNewTab<Cr>
" inoremap <silent> <expr> <C-j> mucomplete#neosnips#expand_snippet("\<cr>")
"}}}
" vim: set foldmethod=marker:foldlevel=0
