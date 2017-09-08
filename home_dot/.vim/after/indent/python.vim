setlocal nocindent
setlocal shiftwidth=4
setlocal softtabstop=4

if !exists('b:undo_indent')
  let b:undo_indent = ''
endif
let b:undo_indent .= '| setlocal '.join([
\  'cindent<',
\  'shiftwidth<',
\  'softtabstop<',
\])
