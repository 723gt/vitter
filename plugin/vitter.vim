"=============================================================================
" File: vitter.vim
" Author: 723gt
" Created: 2018-09-08
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_vitter')
  finish
endif
let g:loaded_vitter = 1

"vim start call
if has('vim_starting')
  call vitter#SetBranchName()
endif

set statusline+=%{g:this_branch}
command -nargs=* Gc call vitter#GitCheckout(<f-args>)
command -nargs=* Gb call vitter#GitBranchs(<f-args>)
command -nargs=* Gl call vitter#GitLog(<f-args>)
command -nargs=* Gd call vitter#GitDiff(<f-args>)
command -nargs=* Gr call vitter#GitRebase(<f-args>)
command -nargs=* Gf call vitter#GitFetch(<f-args>)
command Gcf call vitter#GitCheckoutThisFIle()
