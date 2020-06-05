; 'foo is shorthand for (quote foo), which is to tell
; scheme not ot evaluate it. Use the symbol, or atom
; repl: https://repl.it/languages/scheme

; These are all atoms
; Atoms are not lists. Lists are not atoms.
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

; car: gets the first thing in a list
; The law of car:
; The primitive car is defined only for non-empty lists.
(car '(a b c)) ; 'a
(car '((a b c) x y z)) ; '(a b c)
(car '(((hotdogs)) (and) (pickle) relish)) ; '((hotdogs))
(car (car '(((hotdogs)) (and)))) ; '(hotdogs)

; cdr: gets list with the first element removed (tail)
; The law of cdr:
; The primitive cdr is defined only for non-empty lists.
; The cdr of a non-empty list is always another list.
(cdr '(a b c)) ; '(b c)
(cdr '((a b c) x y z)) ; '(x y z)
(cdr '(hamburger)) ; '()
(cdr '((x) t r)) ; '(t r)

; car and cdr
(car (cdr '((b) (x y) ((c))))) ; (x y)
(cdr (cdr '((b) (x y) ((c))))) ; (((c)))

; cons: appends an item to the front of a list
; The law of cons:
; Takes two arguments: First is any S-expression second is any list
; cons returns a list
(cons 'a '(b c)) ; (a b c)
(cons '(banana and) '(peanut butter and jelly)) ; ((banana and) peanut butter and jelly)
(cons () '(a b (c))) ; (a b (c))
(cons 'a ()) ; (a)
(cons 'a (car '((b) c d))) ; (a b)

; null?: determine if a list is null
; The law of null?:
; The primitive null? is defined only for lists
; Returns true or false
() ; a null list
(null? ()) ; true
(null? (quote ())) ; true
(null? '(a)) ; false

; The law of eq?
; The primitive eq? takes two arguments. Each must be a non-numeric atom.
; Returns true or false
(eq? 'Harry 'Harry) ; true
(eq? 'butter 'margarine) ; false
