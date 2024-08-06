\*

Dr AJY 2018-01-03

*\

\\ See (Winston, 1992), the formulas on Page 457:
\\
\\ For the output layer,
\\ beta(z) = d(z) - o(z)
\\
\\ where
\\ beta(z) =df the beta value for Neuron #z
\\ d(z)    =df the desired output for the Neuron #z
\\ o(z)    =df the actual output for this sample, for the Neuron #z
\\
\\ Below the argument H is a training sample
\\ The neurons in the ANN (output) layer, and the numbers in H,
\\ shall be in the same order, number #n to Neuron #n in the lists.

\*

One example of the Samples:

(record-samples
    [ [ [ 1 1 0 0 0 0 ] [0 1] ]
      [ [ 1 0 1 0 0 0 ] [0 1] ]
      [ [ 1 0 0 1 0 0 ] [1 0] ]
      [ [ 1 0 0 0 1 0 ] [1 0] ]
      [ [ 1 0 0 0 0 1 ] [1 0] ]
      [ [ 0 1 1 0 0 0 ] [0 1] ]
      [ [ 0 1 0 1 0 0 ] [1 0] ]
      [ [ 0 1 0 0 1 0 ] [1 0] ]
      [ [ 0 1 0 0 0 1 ] [1 0] ]
      [ [ 0 0 1 1 0 0 ] [1 0] ]
      [ [ 0 0 1 0 1 0 ] [1 0] ]
      [ [ 0 0 1 0 0 1 ] [1 0] ]
      [ [ 0 0 0 1 1 0 ] [0 1] ]
      [ [ 0 0 0 1 0 1 ] [0 1] ]
      [ [ 0 0 0 0 1 1 ] [0 1] ] ]
      )


Here one sample would be:

    [ [ 0 0 1 0 1 0 ] [1 0] ]

Where the outputs are [ 1 0 ].

then, the outputs list are handled as the list of output neurons as below

*\


(define beta-output
    H ->
      (do (beta-output-aux
              (<-vector (value *ANN*)  \\ the output layer vector
                        (value *last-layer*))
	      1
              (hd (tl H))) \\ one sample, the desired, the training, outputs
          []))



\\ Repetitio est mater studiorum:
\\ For the output layer,
\\ beta(z) = d(z) - o(z)
\\
\\ where
\\ beta(z) =df the beta value for Neuron #z
\\ d(z)    =df the desired output for the Neuron #z
\\ o(z)    =df the actual output for this sample, for the Neuron #z
\\
\\ NOTA BENE: The neurons and the sample numbers shall be in the
\\ same order.


(define beta-output-aux
  \\ Here the first argument are the output layer neurons vector.
  \\ The desired output numbers for the output layer neurons
  \\ are in the 3rd argument list.  See (Winston, 1992) on Page 457.
  Vec Counter [] -> [] \\ All output layer neurons processed?
  Vec Counter Lst -> [] where (> Counter (value *MAXINLAYER*))
  Vec Counter Lst ->
    (beta-output-aux
        Vec (+ 1 Counter) Lst) where (= (<-vector Vec Counter)
	                                (value *EMPTY*)) \\ No neuron?
  Vec Counter [NR | T2] ->
    (let
      Oz (getp (<-vector Vec Counter) pout) \\ Output number from N
      Dz NR \\ Desired output number
      Bz (- Dz Oz)
      Ign (putp (<-vector Vec Counter) Bz pb) \\ Update data structure
      Ign (beta-output-aux Vec (+ 1 Counter) T2) \\ recurse
      []) \\ end the (let ...) form
) \\ end function


