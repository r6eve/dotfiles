setlocal iskeyword-=/
setlocal lispwords-=if

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| setlocal '.join([
\  'iskeyword<',
\  'lispwords<',
\])
