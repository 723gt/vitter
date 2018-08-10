command -nargs=* Gc call GitCheckout(<f-args>)
command Gb call GitBranchs()
command Gl call GitLog()
command -nargs=? Gd call GitDiff(<f-args>)

function GitCheckout(branch) 
  let git = "git checkout "
  call system(git.a:branch)
endfunction

function GitBranchs()
  let b = system("git branch")
  echo b
endfunction

function GitLog()
  let l = system("git log")
  echo l
endfunction
 
function GitDiff(...)
  let git = "git diff "
  if a:0 >= 1
    let log = system(git.a:1)
  else
    let log = system(git)
  end
  echo log
endfunction
