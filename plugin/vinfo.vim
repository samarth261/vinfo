" This is the actual plugin
"

" The Info function splits the screen and opens a scratch on top where the
" corressponding info file will be opened.
function! Info ()
  " we get the current file name
  let parts=split(bufname("%"),"/")
  let useslash="/"
  if len(parts) == 1
    let useslash=""
  endif

  let vinfofile=join(parts[:-2],"/") . useslash . "." . parts[-1] . ".vinfo"
  " let vinfofile=expand("%:p:h") . "/" . ".vinfo." . expand("%") . ".vinfo"

  execute "vertical rightbelow split" vinfofile
endfunction
