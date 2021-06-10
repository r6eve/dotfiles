setlocal iskeyword=@,48-57,_,192-255,:

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| setlocal '.join([
\  'iskeyword<',
\])
