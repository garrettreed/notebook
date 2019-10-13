; 'foo is shorthand for (quote foo), which is to tell
; scheme not ot evaluate it. Use the symbol, or atom


; These are all atoms
'atom
'turkey
1942
'1942
'u
'*abc$
(quote *abc$)

; These are all lists
('atom)
('atom 'turkey 'or)
(('atom 'turkey) 'or)

; This is not a list, but it is two S-expressions.
; First is a list, second is an atom.
'(atom turkey) 'or

; These are all S-expressions
'xyz
'(x y z)
'((x y) z)

; There are six S-expressions in this list
'(how are you doing so far)

; There are three S-expressions in this list
'(((how) are) ((you) (doing so)) far)

; The empty list is a list. It has zero S-expressions.
; It is not an atom.
'()

; List of empty lists is also a list
'(() () () ())

; car
; The law of car:
; The primitive /car/ is defined only for non-empty lists.
(car '(a b c)) ; 'a
(car '((a b c) x y z)) ; '(a b c)
(car '(((hotdogs)) (and) (pickle) relish)) ; '((hotdogs))
(car (car '(((hotdogs)) (and)))) ; '(hotdogs)

; cdr
; The law of cdr:
; The primitive /cdr/ is defined only for non-empty lists.
; The /cdr/ of a non-empty list is always another list.
(cdr '(a b c)) ; '(b c)
(cdr '((a b c) x y z)) ; '(x y z)
(cdr '(hamburger)) ; '()
(cdr '((x) t r)) ; '(t r)

; car and cdr
(car (cdr '((b) (x y) ((c))))) ; (x y)
(cdr (cdr '((b) (x y) ((c))))) ; (((c)))
