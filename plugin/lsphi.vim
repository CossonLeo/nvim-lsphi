""""""""""""""""""""""""""""""""""""""""""
"    LICENSE: 
"     Author: 
"    Version: 
" CreateTime: 2019-04-03 13:35:17
" LastUpdate: 2019-04-03 13:35:17
"       Desc: 
""""""""""""""""""""""""""""""""""""""""""

if exists('s:nvim_lsphi')
    finish
endif
let s:nvim_lsphi = 1

func! lsphi#get_symbol() abort
    let l:params = {
                \ 'filename': LSP#filename(),
                \ 'text': LSP#text(),
                \ 'handle': v:false,
                \ }
    "call extend(l:params, get(a:000, 0, {}))
    "return LanguageClient#Call('textDocument/documentSymbol', l:params, l:Callback)
    return LanguageClient#Call('textDocument/documentSymbol', l:params, function("s:symbol_callback"))
endfunction

func! s:symbol_callback(data) abort
	echo string(a:data)
endfunc


func! lsphi#highlight() abort
    let l:params = {
                \ 'filename': LSP#filename(),
                \ 'text': LSP#text(),
                \ 'line': LSP#line(),
                \ 'character': LSP#character(),
                \ 'handle': v:false,
                \ }
    call extend(l:params, get(a:000, 0, {}))
    return LanguageClient#Call('textDocument/documentHighlight', l:params, function('s:highlight_callback'))
endfunc

func! s:highlight_callback(data)
	echo string(a:data)
endfunc
