; a lat is a list of atoms
(define lat?
    (lambda (l)
        (cond
            ((null? l) #t) ; if  null list, return true
            ((atom? (car l)) (lat? (cdr l))) ; else-if first element in list is atom, recur with cdr of list
            (else #f)))) ; else return false

(lat? '(Jack Sprat)) ; true, because each S-expression is an atom
(lat? '((Jack Sprat) 'blah)) ; false since the first S-expression is a list.
(lat? ()) ; true because it does not contain a list

; or takes two questions and returns true if either are true, and false if none are true
(or (null? '(a b c)) (null? ())) ; true

(define member?
    (lambda (a lat)
        (cond
            ((null? lat) #f) ; satisfies first commandment
            (else (or (eq? (car lat) a) ; if first element matches
                (member? a (cdr lat))))))) ; or if any other element return true

; could also be written with an else-if, rather than combining cases in an or:
(define member?
    (lambda (a lat)
        (cond
            ((null? lat) #f)
            ((eq? (car lat) a) #t)
            (else (member? a (cdr lat))))))

; The First Commandment
; Always ask null? as the first question in expressing any function.

