command -nargs=* Gc call GitCheckout(<f-args>)
command Gb call GitBranchs()
command -nargs=* Gl call GitLog(<f-args>)
command -nargs=* Gd call GitDiff(<f-args>)

let s:Y = 89
lockvar s:Y

function GitCheckout(branch) 
  let git = "git checkout "
  let this_file = expand("%:t")
  let log = system(git.a:branch)
  if (a:branch == this_file )
    echo "This file checkouted by git"
    echo "So I want to close once (Y/n)"
    let y = getchar() 
    call s:CloseCheack(y)
  endif
  echo log
endfunction

function GitBranchs()
  let branch = system("git branch")
  echo branch
endfunction

function GitLog(...)
  if(a:0 >= 1)
    let ops = join(a:000)
    let git = "git log "
    let log = system(git.ops)
  else
    let log = system("git log")
  endif
  echo log
endfunction
 
function GitDiff(...)
  let git = "git diff "
  if (a:0 == 1)
    let log = system(git.a:1)
  elseif (a:0 >= 2)
      let ops = join(a:000)
    let log = system(git.ops)
  else 
    let log = system(git)
  end
  echo log
endfunction

function s:CloseCheack(y)
  if (a:y == s:Y)
    q!
  endif
endfunction
