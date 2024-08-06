\*

Dr AJY 2018-06-15

Assign one set of inputs into the inputs of the ANN, which inputs of
the ANN are the 1st stratum of neurons.

Function (assign-inputs)

The argument is a vector of numbers to be inserted into the
numeric inputs position of the first stratum of the ANN.


*\


(define assign-inputs
    INP ->
        (let
	    FS (<-vector (value *ANN*) 1) \\ first stratum of input neurons
	    \\ INP are the inputs numbers vec
	    Ignore (update-assign INP FS) \\ inputs vector ==> the neurons
	    []))

\*

(update-assign...) takes the vector of the ANN input neurons, and the
inputs in a list, and assigns the inputs into the input neurons,
into the pinps vector fields.

 *\


(define update-assign
    Inps FS -> (update-assign-h Inps FS 1)) \\ Iterate over all neurons


(define update-assign-h
    Inps FS Indx -> [] where (> Indx (value *MAXINLAYER*))
    Inps FS Indx -> (update-assign-h
                        Inps
			FS
			(+ 1 Indx)) where (= (<-vector FS Indx)
			                     (value *EMPTY*))
    Inps FS Indx -> \\ Handle Neuron #Indx
        (do
	    (update-neuron-h Inps (<-vector FS Indx) 1) \\ Iter: Neuron #Indx
	    (update-assign-h Inps FS (+ 1 Indx))
	    []))


(define update-neuron-h \\ Iterate over NRN's all inputs
    Inps NRN Indx2 -> [] where (> Indx2 (value *MAXVEC*))
    Inps NRN Indx2 -> (update-neuron-h Inps NRN (+ 1 Indx2))
                          where (= (<-vector (getp NRN pins) Indx2)
	                           (value *EMPTY*))
    Inps NRN Indx2 -> 
        (let
	    V (getp NRN pins-n)
	    I (<-vector Inps Indx2) \\ Inputs item in question
	    Ign (vector-> V Indx2 I)
            Ign (putp NRN V pins-n)
	    (update-neuron-h 
	        Inps
                NRN
		(+ 1 Indx2))))

