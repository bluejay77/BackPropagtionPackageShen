\*

Dr AJY 2018-01-03


 See the formula in (Winston, 1992) on Page 457.

The weight change formula is:

delta-weight(i-->j) =
the change of the weight from Neuron #i to Neuron #j =
the change to the Weight #i of the Neuron #j =
delta-weight(i,j) = r * o(i) * o(j) * (1 - o(j)) * beta(j)

Here, the #i are the inputs of the entire ANN.
The values delta-weight(i,j) are deltas to the weights for the
input #i of the input neuron #j.  The #j are the 1st stratum, id est
the input stratum.


r        ==df the (value *r*) parameter (Winston, 1992)
o(i)     ==df the output of Neuron #i, the outputing neuron
              into this one, on Stratum 1: here the ANN input values
              The #i are the inputs of the whole ANN.
o(j)     ==df the output of this neuron, output of Neuron #j
beta(j)  ==df the beta of Neuron #j

weight(i,j) ==df the weight from Neuron #i into this neuron, #j
  ==df the weight #i of the Neuron #j, of input #i
  ==df here the weight #i of the Neuron #j, of input #i

Compute the deltas to the weights with layers 1, 2, 3, ..., N
in the increasing order
Argument H is the current training sample
Neurons and the numbers must be in the same order in the
data structures.

*\

\*

 The deltas-1st function
 Arg are a sample, exemplaris gratis
 [ [ 0 0 1 1 1 1 ] [1 0]]

*\

(define deltas-1st
    H ->
    (let
        Stratum1 (<-vector (value *ANN*) 1) \\ 1st ANN stratum
        INPS (hd H)                         \\ Input items for this sample
	V (vector (value *MAXVEC*))
	Vec (fill-vec V INPS 1)
        Ign (iterate-1st-stratum-h Stratum1 Vec 1)
	[]))


\\ Iterate over all neurons in the neuron stratum #1
\\ For each neuron, fill the pins and the pins-n from the
\\ input number list.  Then call the function deltas-n 
\\ for this neuron in question.


(define iterate-1st-stratum-h
    S Vec Counter -> [] where (> Counter (value *MAXINLAYER*))
    S Vec Counter -> (iterate-1st-stratum-h
                       S
		       Vec
		       (+ 1 Counter)) where (= (<-vector S Counter)
		                               (value *EMPTY*)) \\ No neuron?
    S Vec Counter ->
        (do 
            (fill-n-inps
	        (<-vector S Counter) \\ the neuron in question
		Vec \\ filled vector of input numbers
		1)
	    (deltas-n (<-vector S Counter)) \\ Compute the deltas
	    (iterate-1st-stratum-h S Vec (+ 1 Counter)) \\ Recurse
	    []))


(define fill-n-inps
    P Vec Indx -> [] where (> Indx (value *MAXVEC*))
    P Vec Indx -> (fill-n-inps P Vec (+ 1 Indx))
                      where (= (<-vector (getp P pins) Indx)
		               (value *EMPTY*))
    P Vec Indx ->
        (let
	    I (getp P pins-n)
	    Ign (vector-> I Indx (<-vector Vec Indx) )
	    Ign (putp P I pins-n)
	    (fill-n-inps P Vec (+ 1 Indx))))

