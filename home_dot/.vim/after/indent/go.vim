setlocal cinoptions+=j1
setlocal noexpandtab
setlocal shiftwidth=8
setlocal softtabstop=0

if !exists('b:undo_indent')
  let b:undo_indent = ''
endif
let b:undo_indent .= '| setlocal '.join([
\  'cinoptions<',
\  'noexpandtab<',
\  'shiftwidth<',
\  'softtabstop<',
\])
