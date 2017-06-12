setlocal omnifunc=javacomplete#Complete

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| setlocal '.join([
\  'omnifunc<',
\])
