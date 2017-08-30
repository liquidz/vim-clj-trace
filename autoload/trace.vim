let s:save_cpo = &cpo
set cpo&vim

let g:trace#name = 'clojure.tools.trace'

function! s:require_tools_trace() abort
  call fireplace#eval(printf("(require '%s)", g:trace#name))
endfunction

function! s:trace_eval(...) abort
  if a:0 == 1
    let arg = a:000[0]
  else
    let arg = call("printf", a:000)
  endif

  call s:require_tools_trace()
  return fireplace#eval(printf("(%s/%s)", g:trace#name, arg))
endfunction

function! trace#trace_vars(var) abort
  let var = (a:var == '' ? expand('<cword>') : a:var)
  echo s:trace_eval("trace-vars %s", var)
endfunction

function! trace#trace_ns() abort
  echo s:trace_eval("trace-ns *ns*")
endfunction

function! trace#untrace_ns() abort
  echo s:trace_eval("untrace-ns *ns*")
endfunction

function! trace#untrace_vars(var) abort
  let var = (a:var == '' ? expand('<cword>') : a:var)
  echo s:trace_eval("untrace-vars %s", var)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
