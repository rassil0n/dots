" italic
nnoremap ;i bi\textit{<Esc>ea}<Esc>
vnoremap ;i <Esc><Esc>`<i\textit{<Esc>`>8la}<Esc>`<8lv`>8l

" bold
nnoremap ;b bi\textbf{<Esc>ea}<Esc>
vnoremap ;b <Esc><Esc>`<i\textbf{<Esc>`>8la}<Esc>`<8lv`>8l

" underline
nnoremap ;u bi\underline{<Esc>ea}<Esc>
vnoremap ;u <Esc><Esc>`<i\underline{<Esc>`>11la}<Esc>`<11lv`>11l

" etc
inoremap ;; \item<space>
inoremap ;c \centering<Esc>
