if exists('g:loaded_clojure_trace')
  finish
endif
let g:loaded_clojure_trace = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=? TraceVars   call trace#trace_vars(<q-args>)
command! -nargs=? UntraceVars call trace#untrace_vars(<q-args>)
command!          TraceNs     call trace#trace_ns()
command!          UntraceNs   call trace#untrace_ns()

nnoremap <silent> <Plug>TraceVars   :<C-u>TraceVars<CR>
nnoremap <silent> <Plug>UntraceVars :<C-u>UntraceVars<CR>
nnoremap <silent> <Plug>TraceNs     :<C-u>TraceNs<CR>
nnoremap <silent> <Plug>UntraceNs   :<C-u>UntraceNs<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

