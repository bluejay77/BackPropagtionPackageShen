\*

Function to remember the training samples

record-samples --- Set the variable *Samples*


Make the training material

The training material, ie. the samples are stored in a list of
lists:

[ [ [ input items 1 ] [ output-values1 ] ] Item #1
  [ [ input items 2 ] [ output-values2 ] ] Item #2
  [ [ input items 3 ] [ output-values3 ] ] ]


such as the below for the logical XOR function:
The truth table for the exclusive OR

(set xor [ [ [ 0 0 ] [ 0 ] ] Truth table row #1
           [ [ 1 0 ] [ 1 ] ] Truth table row #2
           [ [ 0 1 ] [ 1 ] ] Truth table row #3
           [ [ 1 1 ] [ 0 ] ] ] )

Note that the samples have the type
(list (list (list number)))

Store the training material into the global variable *Samples*
by calling the function (record-samples [[[ ... ]]])

The training material are a list of individual samples.

Each sample is a list of inputs of neurons of neuron stratum #1,
followed by the list of outputs for this sample, at the output
stratum.

*\


(datatype training-samples

__________________________________
(value *Samples*) : (list (list (list number)));

)


(define record-samples
    S -> (do
             (set *Samples* S)
	     []))

