" This is the actual plugin
"

" The Info function splits the screen and opens a scratch on top where the
" corressponding info file will be opened.
function! Info ()

  if len(g:VINFO_FILE_PREFIX) > 0
    " If the vinfo file prefix is specified then no matter where we are we get
    " the full path of the file.
    let vinfofile=g:VINFO_FILE_PREFIX . expand("%:p:h") . "/." . expand("%:p:t") . ".vinfo"
  else
    let parts=split(bufname("%"),"/")
    let useslash="/"
    if len(parts) == 1
      " This implies that we are at the root of the file.
      let useslash=""
    endif
    let vinfofile=join(parts[:-2],"/") . useslash . "." . parts[-1] . ".vinfo"
  endif

  " let vinfofile=expand("%:p:h") . "/" . ".vinfo." . expand("%") . ".vinfo"

  execute "vertical rightbelow split" vinfofile
endfunction
