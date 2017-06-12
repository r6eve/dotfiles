setlocal lispwords+=call-with-input-file,with-input-from-port,letrec*,let1,
\let-args,while,until,rxmatch-let,rxmatch-if,rxmatch-cond,rxmatch-case,
\let-optionals*,let-keywords,with-input-from-file,if-let1,rlet1,
\with-output-to-file,call-with-output-file,with-output-to-port,dbi-prepare,
\guard,receive,define-macro,list,syntax-rules,regexp-replace,match,match-let,
\match-let1,match-define,parametarize,and-let*,define-method,define-library,
\time-these/report,define-values

setlocal lispwords-=if

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| setlocal '.join([
\  'lispwords<',
\])
