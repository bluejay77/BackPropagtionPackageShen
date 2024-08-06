\*

AJY 2018-07-07

Zero the pdel fields before processing one Sample

*\


(define zero-pdel
    -> (zero-pdel-h 1))



(define zero-pdel-h
    Counter -> [] where (> Counter (value *MAXNEURONS*))
    Counter -> (zero-pdel-h (+ 1 Counter))
                   where (= (<-vector (value *obarray*) Counter)
                            (value *EMPTY*))
    Counter ->
        (let
	    N (<-vector (value *obarray*) Counter)
	    Ign (putp N (novel-zero-vector) pdel)
	    Ign (zero-pdel-h (+ 1 Counter))
	    []))


            
