setlocal indentexpr=GetSchemeIndent()

setlocal nocindent

if !exists('b:undo_indent')
  let b:undo_indent = ''
endif
let b:undo_indent .= '| setlocal '.join([
\  'cindent<',
\  'indentexpr<',
\])

function! GetSchemeIndent()
  let n0 = v:lnum
  let n1 = v:lnum - 1
  let l0 = getline(n0)
  let l1 = getline(n1)

  let at_new_line_p = (col('.') - 1) == matchend(l0, '^\s*')
  if at_new_line_p
    if l1 =~# '\v^\s*\(<else>'
      return indent(n1) + 1
    endif
    return -1
  endif
endfunction
