let s:Y = 89
lockvar s:Y
let s:EMPTY_ARG = [""]
lockvar s:EMPTY_ARG
let s:NOT_GIT = "fatal: not a git repository"
lockvar s:NOT_GIT

function Vitter#GitCheckout(branch) 
  let l:git = "git checkout "
  let l:this_file = expand("%:t")
  let log = system(l:git.a:branch)
  if (a:branch == l:this_file )
    call s:CloseMsg()
  endif
  echo log
  call s:SetBranchName()
endfunction

function Vitter#GitCheckoutThisFIle()
  let l:git = "git checkout "
  let l:this_file = expand("%:p")
  call s:CommandRun(l:git.l:this_file, s:EMPTY_ARG)
  call s:CloseMsg()
endfunction

function Vitter#GitBranchs(...)
  let l:git = "git branch "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000) 
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction

function Vitter#GitLog(...)
 let l:git = "git log "
  if(a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction
 
function Vitter#GitDiff(...)
  let l:git = "git diff "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else 
    call s:CommandRun(l:git, s:EMPTY_ARG)
  end
endfunction

function Vitter#GitRebase(...)
  let l:git = "git rebase "
  if (a:0 >= 1)
    call s:CommandRun(l:git, a:000)
  else
    call s:CommandRun(l:git, s:EMPTY_ARG)
  endif
endfunction

function Vitter#GitFetch(...)
  let l:git = "git fetch "
  if (a:0 >= 1 )
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

function s:GetThisBranch()
  let l:branch = system("git symbolic-ref --short HEAD")
  if (strlen(l:branch) == 0 || match(s:NOT_GIT, l:branch) == 0)
    return "non git"
  endif
  let l:branch_chop = strpart(l:branch, 0, strlen(l:branch)-1)
  return l:branch_chop
endfunction

function s:SetBranchName()
  let g:this_branch = s:GetThisBranch()
endfunction

"vim start call
if has('vim_starting')
  call s:SetBranchName()
endif

