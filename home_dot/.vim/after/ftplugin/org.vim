setlocal conceallevel=0
setlocal concealcursor=

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| setlocal '.join([
\  'conceallevel<',
\  'concealcursor<',
\])
