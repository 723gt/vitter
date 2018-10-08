# vitter  
this vitter is vim plugin  
Control git from  within vim  
in production ...  

# Commands
## git branch  
`:Gb <options>`  

this file checkout command's
`:Gcf `

## git checkout  
`:Gc <options>`  

## git log  
`:Gl <options>`  

## git diff 
`:Gd <options>`  

## git rebase  
`:Gr <options>`  

## git fetch   
`:Gf <options>`  

## git grep 
` :GG <option> <word> `

# other functoin  
## Display now branch on status line in vim   
if your vim is status line non actives  
edit your .vimrc like this at first  
```
set laststatus=2  
set statusline+=%=  
```

# install  
if use `NeoBundle`  
.vimrc add  
`NeoBundle "723gt/vitter"`

or dein.vim use  
`call dein#add('723gt/vitter')`   

