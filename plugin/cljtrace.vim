if exists('g:loaded_clojure_trace')
  finish
endif
let g:loaded_clojure_trace = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=? CljTraceVars   call cljtrace#trace_vars(<q-args>)
command! -nargs=? CljUntraceVars call cljtrace#untrace_vars(<q-args>)
command!          CljTraceNs     call cljtrace#trace_ns()
command!          CljUntraceNs   call cljtrace#untrace_ns()

nnoremap <silent> <Plug>CljTraceVars   :<C-u>CljTraceVars<CR>
nnoremap <silent> <Plug>CljUntraceVars :<C-u>CljUntraceVars<CR>
nnoremap <silent> <Plug>CljTraceNs     :<C-u>CljTraceNs<CR>
nnoremap <silent> <Plug>CljUntraceNs   :<C-u>CljUntraceNs<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

