\*

AJY 2018-06-18

See (Winston, 1992), the formula on Page 457 and (Haykin, 1999): In
the end of an iteration round for one training sample, alter the
weights by adding the pdel fields into the weights of the network.

*\



(define change-weights
    -> (do (change-weights-aux (value *obarray*) 1)))



(define change-weights-aux
    V N -> [] where (> N (value *MAXNEURONS*))
    V N -> (change-weights-aux V (+ 1 N))
               where (= (<-vector V N) (value *EMPTY*)) \\ Empty slot
    V N -> 
        (let
	    NRN (<-vector V N)
            Ign (change-weights-pctron NRN 1)
	    \\ Assign the pdel-n-p vector from the previous one
	    OLDV (<-vector (getp NRN pdel-n))
	    Ign (putp NRN OLDV pdel-n-p)
            Ign (change-weights-aux V (+ 1 N)) \\ Recurse
            []))



(define change-weights-pctron
    P Counter -> P where (> Counter (value *MAXVEC*))
    P Counter ->
        (change-weights-pctron P (+ 1 Counter))
	    where (= (<-vector (getp P pwts) Counter)
	             (value *EMPTY*))
    P Counter ->
        (let
	    PWTS (getp P pwts-n) \\ Weights
	    PDEL (getp P pdel-n) \\ Deltas to Weights
	    PDEL-P (getp P pdel-n-p) \\ Previous Deltas to Weights
	    W1 (<-vector PWTS Counter) \\ Old Weight
	    D1 (+ (* (value *alpha*) (<-vector PDEL-P Counter))
	          (<-vector PDEL Counter)) \\ Corresponding pdel
	    NW (+ W1 D1) \\ New Weight
	    Ign (vector-> PWTS Counter NW) \\ Modify the data structure
	    Ign (putp P PWTS pwts) \\ Assign it to the neuron
	    (change-weights-pctron P (+ 1 Counter))))




