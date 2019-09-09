# vi Notes

## File Recovery

`* vi -r filename`

## Moving Around

`$` move cursor to end of current line
`w` move to beg of next word
`b` move back to beg of preceding word
`nG` go to n Line

## Undo/Redo

`u` Undo
`ctrl-R` Redo

## Adding Text

`i` insert before cursor
`I` insert at beginning of line
`a` insert after cursor
`A` insert at end of line
`o` open and insert at line below
`O` open and insert at line above

## Changing Text

`r` replace single char under cursor
`R` replace chars, starting with cursor until esc
`cw` change current word with new text until esc
`C` change the chars in the current line until esc
`cc` change the entire line until esc

## Deleting Text

`x` delete single char under cursor
`dw` delete single word starting with char under cursor
`D` delete remainder of line
`dd` delete whole line
`ndd` delete n lines with current line

## Cut and Paste

`yy` copy the current line
`Nyy` copy next N lines including current
`p` paste

## Search

`/string` search forward
`?string` search backward
`n` next
`N` prev
