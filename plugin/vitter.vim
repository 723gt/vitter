command -nargs=* Gc call GitCheckout(<f-args>)
command -nargs=* Gb call GitBranchs(<f-args>)
command -nargs=* Gl call GitLog(<f-args>)
command -nargs=* Gd call GitDiff(<f-args>)
command -nargs=* Gr call GitRebase(<f-args>)
command Gcf call GitCheckoutThisFIle()

let s:Y = 89
lockvar s:Y
let s:EMPTY_ARG = [""]
lockvar s:EMPTY_ARG

function GitCheckout(branch) 
  let l:git = "git checkout "
  let l:this_file = expand("%:t")
  let log = system(l:git.a:branch)
  if (a:branch == l:this_file )
    call s:CloseMsg()
  endif
  echo log
endfunction

function GitCheckoutThisFIle()
  let l:git = "git checkout "
  let l:this_file = expand("%:p")
  call s:CommandRun(l:git.l:this_file, s:EMPTY_ARG)
  call s:CloseMsg()
endfunction

function GitBranchs(...)
  let l:git = "git branch "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000) 
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction

function GitLog(...)
 let l:git = "git log "
  if(a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction
 
function GitDiff(...)
  let l:git = "git diff "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else 
    call s:CommandRun(l:git, s:EMPTY_ARG)
  end
endfunction

function GitRebase(...)
  let l:git = "git rebase "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction

" args: basecmd, ops
function s:CommandRun(base, ops)
  let join_ops = join(a:ops) 
  let log = system(a:base." ".join_ops)
  echo log
endfunction

function s:CloseCheack(y)
  if (a:y == s:Y)
    q!
  endif
endfunction

function s:CloseMsg()
  echo "This file checkouted by git"
  echo "So I want to close once (Y/n)"
  let y = getchar() 
  call s:CloseCheack(y)
endfunction
