" BASICS
	colorscheme nord
	set wildmenu
	set wildmode=longest:full,full
	set relativenumber number
	set splitbelow splitright
	set cursorline
	set nocompatible
	set path+=**
	set shortmess+=c
	set hidden
	set noswapfile
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	" set expandtab

" COMPLETION
        set completeopt+=menuone
        set completeopt+=noselect

	" autocmd! Bufread,Bufnewfile */snip/* setlocal filetype=neosnippet
	" autocmd FileType neosnippet set foldmethod=marker

" SET TITLE
	set title
	autocmd BufEnter * let &titlestring = "(nvim) - " . expand("%:p")

" ENABLE MOUSE
	set mouse=a

" USE SYSTEM CLIPBOARD (NEOVIM ONLY)
	set clipboard+=unnamedplus

" FILETYPE PLUGIN
	filetype plugin on
	filetype plugin indent on
	syntax on

" FOR BETTER SUBSTITUTION (NEOVIM ONLY)
	set inccommand=split

" CASESENSITVE
	set ignorecase
	set smartcase

" ALWAY CENTER WHEN INSTERTING
	autocmd InsertEnter * norm zz

" HIGHLIGHT TRAILING WHITESPACE
	highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter,InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * call clearmatches()

" REMOVE TRAILING WHITESPACE ON SAVING
	autocmd BufWritePre * %s/\s\+$//e

" SET FILETYPE FOR RMD-FILES
	autocmd BufNewFile,BufRead,BufWrite *.rmd set filetype=markdown

" FOR PRESENTATIONS IN MARKDOWN
	augroup md_pres
		autocmd!
		autocmd BufNewFile,BufRead,BufWrite *.pres set filetype=markdown
		autocmd BufNewFile *.pres -1read ~/.config/nvim/templates/skel.md
	augroup END

" SET FILETYPE FOR LaTeX
	augroup latex
		autocmd!
		autocmd BufRead,BufNewFile *.tex set filetype=tex
		autocmd VimLeave *.tex !texclear %
	augroup END

" SET FILETYPE AND SPECIAL CHARACTERS FOR GROFF
	augroup troff
		autocmd!
		" autocmd BufRead,BufNewFile *.ms set filetype=groff
		autocmd FileType troff set foldmethod=marker
		autocmd FileType troff source ~/.config/nvim/config/groff_char.vim
	augroup END

	augroup md
		autocmd!
		autocmd FileType markdown set conceallevel=2
	augroup END

" LATEX PREVIEW
	" let g:livepreview_previewer = 'zathura-tabbed'

" LOAD SKELS FOR NEW FILES
	" autocmd BufNewFile *.md -1read ~/.config/nvim/templates/skel.md
	" autocmd BufNewFile *.html -1read ~/.config/nvim/templates/skel.html
	" autocmd BufNewFile *.sh -1read ~/.config/nvim/templates/skel.sh

