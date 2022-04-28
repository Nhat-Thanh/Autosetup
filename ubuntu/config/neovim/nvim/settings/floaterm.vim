let g:floaterm_position = 'bottom'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.4
let g:floaterm_wintype = 'split'
let g:floaterm_title = 'Terminal $1/$2'

"nnoremap <C-t> :FloatermNew! clear && fish<CR>
nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t>  <C-\><C-n>:FloatermToggle<CR>

