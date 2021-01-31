function! OvAutoPrefixLine()
  echo ""
  let row = line(".")
  let line = getline(row)
  let i = row
  while i > 0
        \ && line !~ "^\\s*[0-9]\\+\\."
    let i = i - 1
    let line = getline(i)
  endwhile

  " elseif line =~ "^\\s*[0-9]\\+\\."
    let num = matchstr(split(line)[0], "[0-9]*")
    let spaces = line !~ "[0-9]"
    call append(row, repeat(" ", spaces) . (num + 1) . ". ")
    call cursor(row + 1, spaces + strlen(num) + 2)
  " endif
endfunction

function! OvFixOrderedList()
  echo ""
  let ltop = line(".")
  while getline(ltop) =~ "^\\s*[0-9]\\+\\." ||
      \ (getline(ltop) =~ "^\\s" && getline(ltop) !~ "^\\s*$")
    let ltop = ltop - 1
  endwhile

  let lbot = line(".")
  while getline(lbot) =~ "^\\s*[0-9]\\+\\." ||
      \ (getline(lbot) =~ "^\\s" && getline(lbot) !~ "^\\s*$")
    let lbot = lbot + 1
  endwhile

  let ltop = ltop + 1
  let lbot = lbot - 1
  if ltop > lbot
    return
  endif

  let i = 1
  let row = ltop
  while row <= lbot
    let line = getline(row)
    if line =~ "^\\s*[0-9]\\+\\."
      call setline(row, substitute(line, "[0-9]\\+", i, ""))
      let i = i + 1
    endif
    let row = row + 1
  endwhile
endfunction
