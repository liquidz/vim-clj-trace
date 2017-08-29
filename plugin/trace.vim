if exists('g:loaded_clojure_trace')
  finish
endif
let g:loaded_clojure_trace = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 TraceVars   call trace#trace_vars(<q-args>)
command! -nargs=1 UntraceVars call trace#untrace_vars(<q-args>)
command!          TraceNs     call trace#trace_ns()
command!          UntraceNs   call trace#untrace_ns()

nnoremap <silent> <Plug>TraceVars :<C-U>set opfunc=trace#trace_vars<CR>g@

nnoremap <silent> <Plug>UtracsNs :exe <SID>print_last()<CR>


let &cpo = s:save_cpo
unlet s:save_cpo

