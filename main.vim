command -nargs=* Gc call GitCheckout(<f-args>)

function GitCheckout(branch) 
  let git = "git checkout "
  call system(git.a:branch)
endfunction
 
