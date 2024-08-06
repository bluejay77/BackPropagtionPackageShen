\*



Dr AJY 2018-01-28--

Train the multilevel perceptron net

---Algorithm:

(Haykin, 1999) pp. 173--175.

Initialization.  Pick synaptic weights and thresholds from a uniform
distribution, whose mean == 0, and whose variance is given as a
function parameter.  See (Haykin, 1999) p. 174.

Iterate UNTIL (stopping criterion):

    Present (assign) the training examples.  For this epoch.  The
    order of presentation of training examples should be randomized from 
    epoch to epoch.

    Shuffle the training examples.

    FOR (each sample in the shuffled training examples):
        Forward Computation.  Self explanatory.
        Backward Computation.  Compute the betas, deltas.
        Update the ANN numeric values as a part of this one.
    END FOR

END UNTIL

Four epoch iteration stopping criteria:

1.  Number of epochs given, e. g. (bprop 200)

2.  (Winston, 1992) <0.1 or >0.9 criterion, e. g. (cbprop)
Not yet implemented.

3.  (Haykin, 1999) p. 173 criterion -- Euclidean norm of the gradient
of the error surface is sufficiently small, and is given as a function
argument (h1bprop 0.01)
Not yet implemented.

4.  (Haykin, 1999) p. 173 criterion 2: absolute rate of change in the
average squared error per epoch is sufficiently small, is given as a
function parameter, (h2bprop 0.001)
Not yet implemented.

Use the sequential mode: Update the weights after the presentation of
each training example.  (Haykin, 1999) p. 171-172.

IOW, calculate the changes to the weights into the pdel fields of the
neuron data structures, as the example is handled.  After processing
one example, add the pdel (Perceptron Delta) fields into the weights.

Apply the (Anastasiadis, 2005) resilient backpropagation algorithm,
with the Wolfe conditions.



*\



(define bprop
    N -> (train-n N))


(define train-n \\ Train the net, N iteration rounds
    N -> (train-n-h N 1))


(define train-n-h
    N Counter -> [] where (> Counter N)
    N Counter ->
        (do
            (iter (value *Samples*))
	    (train-n-h N (+ 1 Counter))))

	    


(define train
    ANN Samples C ->
        (do
	    (iter ANN Samples) \\ One epoch for all Samples
	    (if (C ANN Samples) \\ Iteration stopping criterion?
	        [] \\ The results are in the ANN (global var)
		(train ANN Samples C))))


(define iter
    Samples ->
        (let
	    S (shufflel Samples) \\ Shuffle the Samples
	    Ign (iterh S) \\ One iteration for all Samples randomized
	    []))


\\ Here, assume a function (random) which will return a random real
\\ in the range [0, 1)


(define shufflel \\ Shuffle a list in a random order
    Lst -> (shufflelh Lst []))


(define shufflelh
    [] Acc -> Acc
    Lst Acc ->
        (let
	    N (length Lst)
	    I (+ 1 (trunc (* (random) N)))
	    X (nth I Lst)
	    X1 (deleten I Lst)
	    (shufflelh
	        X1
		(append Acc [ X ]))))


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



\*

Various modifications:

* http://ieeexplore.ieee.org/document/1007668/

* The Simon Haykin momentum constant, (Haykin, 1999)

* The ICNN 1994 improvement

* The resilient backproparation, the Anastasiadis paper; Here!
  
* The multibackpropagation, the Lopes-Ribeira paper;

TODO: Here the (Winston, 1992) and Anastasiadis, 2005 formulas, also
for the bias.

*\


\\ Fill all the inputs of a neuron from the list Lst

(define fill-vec
    { (vector number) --> (list number) --> number --> (vector number) }
    Vec Lst Counter -> Vec where (> Counter (value *MAX*))
    Vec Lst Counter -> (fill-empty Vec Counter) where (= Lst []) \\ rest
    Vec Lst Counter ->
        (do
	    (vector-> Vec Counter (hd Lst))
	    (fill-vec
	        Vec
		(tl Lst)
		(+ 1 Counter))))


(define fill-empty
    Vec Counter -> Vec where (> Counter (value *MAX*))
    Vec Counter ->
        (do
	    (vector-> Vec Counter 0)
	    (fill-empty Vec (+ 1 Counter))))


(define iterh
  [] -> [] \\ All samples processed?
  [ H | T ] ->
    (let
       V (vector (value *MAX*))
       V (fill-vec V (hd H) 1 ) \\ Fill V w/ the input numbers 
       Ign (assign-inputs V) \\ Take sample inputs from V into the *ANN*
       Ign (zero-pdel)       \\ Zero the pdel fields before round
       Ign (launch-ann)          \\ Fire the entire net
       Ign (beta-output H)       \\ Compute the output layer beta values
       Ign (beta-layers)         \\ Compute the rest of the betas, backw/
       Ign (deltas-1st H)        \\ Deltas, Winston formula, for 1st stratum
       Ign (deltas-2nd)          \\ The deltas for the higher strata
       Ign (change-weights)      \\ Alter weights in ANN after round
       Ign (iterh T)             \\ Recurse for the rest of the samples
       []) \\ end (do...)
) \\ end function


