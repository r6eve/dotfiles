" setlocal indentexpr=GetJavaScriptIndent()
"
" if !exists('b:undo_indent')
"   let b:undo_indent = ''
" endif
" let b:undo_indent .= '| setlocal '.join([
" \  'indentexpr<',
" \])
"
" function! GetJavaScriptIndent()
"   let n0 = v:lnum
"   let n1 = v:lnum - 1
"   let l0 = getline(n0)
"   let l1 = getline(n1)
"
"   let at_new_line_p = (col('.') - 1) == matchend(l0, '^\s*')
"   if at_new_line_p
"     if l1 =~# '\v<function>\s*.*\s*\(.*\)\s*\{'
"       return indent(n1) + &l:shiftwidth
"     endif
"     if l0 =~# '\v\s*\}\)'
"       return indent(n1) - &l:shiftwidth
"     endif
"     return -1
"   endif
" endfunction
