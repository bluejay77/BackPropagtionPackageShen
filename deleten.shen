
\\ AJY 2018-06-13



(define deleten \\ Delete the nth member of a list
    I Lst ->
        (deletenh
	    I
	    Lst
	    1
	    (length Lst)))


(define deletenh
    I [] Counter Len -> []
    I Lst Counter Len -> Lst where (> Counter Len)
    I [H | T] Counter Len -> T where (= I Counter)
    I [H | T] Counter Len ->
        [H | (deletenh I T (+ 1 Counter) Len)])

