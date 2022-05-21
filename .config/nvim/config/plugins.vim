" PROJECT:	nvim
" FILE:		config/plugins.vim
" AUTHOR:	rassil0n
" MAIL:		rassil0n@protonmail.com
" GIT:		https://github.com/rassil0n

call plug#begin('~/.config/nvim/plugged')
"{{{ THEME
Plug 'arcticicestudio/nord-vim'			" the best theme for vim
Plug 'vim-airline/vim-airline'			" for a fancier tagbar and bottom bar
	let g:airline_theme = 'nord'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
"}}}
"{{{ SNIPPETS
Plug 'SirVer/ultisnips'
		let g:UltiSnipsSnippetDirectories=[$HOME. '/.config/nvim/extra/snip/UltiSnips']
		let g:UltiSnipsExpandTrigger="<Tab>"
		let g:UltiSnipsJumpForwardTrigger="<c-j>"
		let g:UltiSnipsJumpBackwardTrigger="<c-k>"
		let g:UltiSnipsListSnippets="<c-l>"
"}}}
"{{{ TAB-COMPLETION
Plug 'lifepillar/vim-mucomplete'		" very simple but powerfull completion-engine
	let g:mucomplete#enable_auto_at_startup = 1
	let g:mucomplete#chains = {}
	let g:mucomplete#chains.default = ['ulti', 'path', 'keyn', 'omni']
"}}}
"{{{ LAYOUT
Plug 'spolu/dwm.vim'				" i really like tiling wm xD
	let g:dwm_map_keys = 0
	nmap <C-J> <C-W>w
	nmap <C-K> <C-W>w
	nmap <M-CR> <Plug>DWMNew
	nmap <C-q> <Plug>DWMClose
	nmap <C-l> <Plug>DWMGrowMaster
	nmap <C-h> <Plug>DWMShrinkMaster
	nmap <C-e> <Plug>DWMFocus
"}}}
"{{{ FLOATTERM/FLOATPREVIEW
Plug 'voldikss/vim-floaterm'			" floating terminal for vim
	nnoremap   <silent>   <F12>   :FloatermToggle<CR>
	tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
"}}}
"{{{ FORMATING TEXT
Plug 'terryma/vim-multiple-cursors'		" edit the different lines the same way
Plug 'tpope/vim-commentary'			" make commenting in any language really easy
Plug 'tpope/vim-surround'			" surround anything
Plug 'chrisbra/NrrwRgn'				" select only a region of your document to edit
Plug 'chrisbra/unicode.vim'			" search and insert unicode-symbols
Plug 'godlygeek/tabular'			" easiet way to alignment
	vmap <Tab> :Tabularize /
Plug 'matze/vim-move'				" move visualizeed text
	nmap <A-d> <Plug>MoveLineDown
	nmap <A-u> <Plug>MoveLineUp
	vmap <A-d> <Plug>MoveBlockDown
	vmap <A-u> <Plug>MoveBlockUp
"}}}
"{{{ MOVE
Plug 't9md/vim-choosewin'			" easy swap between splits and tabs
	let g:choosewin_overlay_enable = 1
	nmap <BS> <Plug>(choosewin)

Plug 'justinmk/vim-sneak'			" quick movement in text, better f/t
	let g:sneak#s_next = 1
	let g:sneak#label = 1

	nmap f <Plug>Sneak_f
	nmap F <Plug>Sneak_F
	xmap f <Plug>Sneak_f
	xmap F <Plug>Sneak_F
	omap f <Plug>Sneak_f
	omap F <Plug>Sneak_F
"}}}
"{{{ SEARCH
Plug 'embear/vim-foldsearch'			" for better search overviews
"}}}
"{{{ SYSTEM
Plug 'chrisbra/SudoEdit.vim'			" write/read files with sudo
Plug 'tpope/vim-repeat'				" make the \"dot\" even more useful
Plug 'michaeljsmith/vim-indent-object'		" for better movements
Plug 'christoomey/vim-system-copy'		" invoke xsel
Plug 'majutsushi/tagbar'			" outline
	map <F8> :TagbarToggle<Cr>
Plug 'junegunn/vim-peekaboo'			" list what is in the vim registers
	let g:peekaboo_prefix = '<leader>'
Plug 'ctrlpvim/ctrlp.vim'
	nmap <C-b> :CtrlPBuffer<Cr>
"}}}
" {{{ADDITONAL MODES
Plug 'dhruvasagar/vim-table-mode'		" easy formatting of markdown tables
"}}}
"{{{ FILETREE
Plug 'lambdalisue/fern.vim'			" the filetree itself
	map <F2> :Fern . -drawer -toggle<Cr>
	map <F3> :Fern bookmark:///<Cr>
Plug 'lambdalisue/fern-bookmark.vim'		" bookmarks in filetree
Plug 'LumaKernel/fern-mapping-fzf.vim'		" fuzzy finding files in the filetree
	let g:fern#scheme#bookmark#store#file = '~/.config/nvim/bookmarks.json'
"}}}
"{{{ ORG-MODE
Plug 'hughbien/org-vim'
Plug 'axvr/org.vim'
	let g:org_state_keywords = ['URGENT', 'TODO', 'WAIT', 'DOING', 'DONE', 'CANCELED']
	let g:org_clean_folds = 1
"}}}
"{{{ PYTHON
Plug 'davidhalter/jedi-vim'
	autocmd FileType python setlocal completeopt-=preview
	let g:jedi#use_tabs_not_buffers = 1
"}}}
"{{{ LATEX
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
	let g:tex_conceal_frac=1
	let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
	let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
	set conceallevel=1
	let g:tex_conceal="abdgm"

Plug 'matze/vim-tex-fold'
    let g:tex_fold_override_foldtext = 1
"}}}
"{{{ MARKDOWN
Plug 'masukomi/vim-markdown-folding'
Plug 'plasticboy/vim-markdown'
	let g:vim_markdown_folding_disabled = 1
	let g:vim_markdown_math = 1
	let g:vim_markdown_frontmatter = 1
	let g:vim_markdown_new_list_item_indent = 2
	let g:vim_markdown_strikethrough = 1

	map <M-Down> <Plug>Markdown_MoveToNextHeader
	map <M-UP> <Plug>Markdown_MoveToPreviousHeader

	autocmd Bufread,Bufnewfile *.note setlocal filetype=markdown
"}}}
"{{{ MISC
Plug 'chrisbra/csv.vim'				" plugin for csv
Plug 'Gavinok/vim-troff'
Plug 'junegunn/goyo.vim'			" work on files without distraction
	let g:goyo_width = 120
	let g:goyo_linenr = 0

Plug 'inkarkat/vim-SyntaxRange'
Plug 'vim-scripts/speeddating.vim'		" in/decrease dates with <C-a>,<C-x>
Plug 'ap/vim-css-color'				" highlight hexcolors in code
Plug 'machakann/vim-highlightedyank'		" visualize what was yanked
Plug 'vim-scripts/utl.vim'			" opening links with vim (pdf,url,jpg)
	let g:utl_cfg_hdl_mt_application_pdf = ':silent !zathura %p &'
    let g:utl_cfg_hdl_mt_image_jpeg = ':silent !sxiv %p &'
	let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
	let g:utl_cfg_hdl_mt_text_directory='VIM'
	map gl :Utl<Cr>

"vimwiki
	Plug 'vimwiki/vimwiki'
		nmap <leader>2 :Vimwiki2HTML<Cr>
		nmap <leader>2a :VimwikiAll2HTML<Cr>
		let g:vimwiki_list = [{'path_html':'~/dl/export/html/', 'path':'~/dox/wiki', 'css_name': 'css/style.css'}]

	" let g:vimwiki_list = [{'path': '~/my_pages/', \ 'css_name': 'main.css'}]
	" let vimwiki_path='~/dox/wiki'
	" let vimwiki_export_path='~/dl/export/html'
	" let vimwiki_css_name='style.css'
	" let g:vimwiki_list = [{ 'css_name': 'main.css'}]

		function! VimwikiFindIncompleteTasks()
		  lvimgrep /- \[ \]/ %:p
		  lopen
		endfunction

		function! VimwikiFindAllIncompleteTasks()
		  VimwikiSearch /- \[ \]/
		  lopen
		endfunction

		nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
		nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>

		let g:vimwiki_folding = 'custom'
		autocmd FileType vimwiki setlocal foldmethod=syntax
		autocmd FileType vimwiki setlocal foldlevel=2
		autocmd FileType vimwiki setlocal foldenable
"}}}
	call plug#end()
"{{{ NOT USED
" Plug 'jceb/vim-orgmode'
" Plug 'unblevable/quick-scope'			" highlight the words you can jump with f/t
" 	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" 	highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 ctermbg=0 cterm=underline
" 	highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 ctermbg=0 cterm=underline
" Plug 'mattn/calendar-vim'
" Plug 'dhruvasagar/vim-dotoo'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'baskerville/vim-sxhkdrc'
" Plug 'dracula/vim',{'as':'dracula'}
		" let g:vim_markdown_folding_level = 6
		" let g:vim_markdown_edit_url_in = 'tab'
" Plug 'pbrisbin/vim-mkdir'
" Plug 'dylanaraps/fff.vim'
		" let g:fff#split = \"30vnew\"
		" let g:fff#split_direction = \"nosplitbelow nosplitright\"
" Plug 'jkramer/vim-checkbox'
" Plug 'mattn/calendar-vim'
" Plug 'chrisbra/DistractFree'
" Plug 'jceb/vim-orgmode'
" Plug 'itchyny/calendar.vim'
" Plug 'qpkorr/vim-renamer'

" Plug 'Shougo/neosnippet-snippets'
" Plug 'Gavinok/vim-minisnip', { 'branch': 'optionalautoindent' }
	" let g:minisnip_autoindent = 0
	" let s:snipdir=globpath(&runtimepath, '**/*extra/snip')
	" let g:minisnip_dir = s:snipdir . ':' . join(split(glob( s:snipdir . '**/'), '\n'), ':')
	" let g:minisnip_trigger = '<C-j>'
	" imap <Nop> <Plug>(minisnip-complete)

" Plug 'jonasw234/vim-mucomplete-minisnip'
	" let mucomplete#user_mappings = {'minisnip': "\<C-r>=MUcompleteMinisnip#complete()\<CR>"}
	" imap <C-s> <Plug>(minisnip-complete)

" Plug 'ncm2/float-preview.nvim'
 	" let g:float_preview#docked = 0
 	" set completeopt-=preview
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" }}}
" vim:foldmethod=marker:foldlevel=0
