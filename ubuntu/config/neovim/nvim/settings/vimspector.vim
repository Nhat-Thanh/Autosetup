let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" lsp list
let g:vimspector_install_gadgets = [ 
			\ 'debugpy', 
			\ 'vscode-cpptools', 
			\ 'CodeLLDB', 
			\ 'vscode-bash-debug', 
			\ 'vscode-java-debug' 
			\]

nnoremap <Leader>dl :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
