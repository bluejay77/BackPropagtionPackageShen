\*

Higher order function (for-all F Lst) which returns true iff
all items in the list Lst return true for the function F, id est,
(F I) returns true, where I is an item in the list Lst.

Dr AJY 2018-01-27

*\




(define for-all
    { (A --> boolean) --> (list A) --> boolean }
    F [] -> true \\ vacuously true
    F [H | T] ->
        (and
	    (F H)
	    (for-all F T)))


(define for-all-vector
    { (A --> boolean) --> (vector A) --> boolean }
    F V -> true where (= (limit V) 0) \\ vacuously true
    F (@v H T) ->
        (and
	    (F H)
	    (for-all-vector F T)))


(define merge
    { (list number) --> (list number) --> (list (list number)) }
    [] _ -> []
    _ [] -> []
    [H1 | T1] [H2 | T2] ->
        (append [[H1 H2]]
	        (merge T1 T2)))


