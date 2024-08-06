\*

Dr AJY 2018-06-16

*\


(define launch-ann
    \\ Fire, ie launch, the entire ANN neuron net
    \\ The inputs are in the data structures
    ->
      (do
          (launch-ann-h 1) []))


(define launch-ann-h
    Counter -> []
          where (> Counter (value *MAXLAYERS*)) \\ All strata handled?
    Counter -> (launch-ann-h (+ 1 Counter))
                   where (= (<-vector (value *ANN*) Counter)
                            (value *EMPTY*)) \\ This stratum empty
    Counter ->
        (do
	    (launch-stratum-h (<-vector (value *ANN*) Counter) 1)
	    (launch-ann-h (+ 1 Counter)) \\ recurse
	    ))


(define launch-stratum-h
    S Counter2 -> [] where (> Counter2 (value *MAXINLAYER*)) \\ All handled?
    S Counter2 -> (launch-stratum-h S (+ 1 Counter2))
                      where (= (<-vector S Counter2)
                                (value *EMPTY*)) \\ No neuron here?
    S Counter2 ->
        (let
	    N (<-vector S Counter2)
            Ign (transfer-function N)
	    Ign (fire-synapses N)
	    Ign (launch-stratum-h S (+ 1 Counter2))
	    []))


