" This is the actual plugin
"

" The Info function splits the screen and opens a scratch on right where the
" corressponding info file will be opened.
function! Info ()
  let src_num_lines = line('$')
  " let src_win_id = win_getid()
  set nowrap

  if len(g:VINFO_FILE_PREFIX) > 0
    " If the vinfo file prefix is specified then no matter where we are we get
    " the full path of the file.
    let vinfofile=g:VINFO_FILE_PREFIX . expand("%:p:h") . "/." . expand("%:p:t") . ".vinfo"

    if !isdirectory(g:VINFO_FILE_PREFIX . expand('%:p:h'))
      call mkdir(g:VINFO_FILE_PREFIX . expand('%:p:h'), 'p')
    endif
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
  " let dest_win_id = win_getid()
  let dest_num_lines = line('$')

  if src_num_lines > dest_num_lines
    let num_new_lines = src_num_lines - dest_num_lines
    whil num_new_lines > 0
      call append(line("$"), "")
      let num_new_lines = num_new_lines - 1
    endwhile
  endif
endfunction
