\*

Dr AJY 2018-01-03

The functionality as to firing neurons

Calling (transfer-function N) where N is a neuron, is equivalent with
firing the neuron N, ie. computing its output.  The function returns
the updated new neuron.  The function also will update the novel
neuron into the data structures.

Another paradigm in Winston: Artificial Intelligence, 3rd edition
ie. (Winston, 1992).  Winston uses demons, to fire ANNs, but the
author considers the (transfer-function ...) method better

The function (fire-synapses N) transmits the neuron N output value
into the synapses following neurons, id est, transfers the output
of the neuron N forwards in the neural net.

*\


(define transfer-function
  N ->
    (let
      AL (activation-level N) \\ Call the activation function
      Ignore (putp N AL pact) \\ Assign it to the data structure
      OUT (threshold AL) \\ Compute the output of the threshold function
      Ignore (putp N OUT pout) \\ Update it in the data structure
      OUT)) \\ Return the output of the neuron


\*

The perceptron threshold function -- after (Haykin, 1999) which
reference calls this function by the name Activation Function The
author has chosen the logistic function after Haykin, p. 168

*\


(define threshold
  Activation ->
      (/ 1.0 (+ 1.0 (exp (- 0.0 (* (value *a*) Activation))))))



\*

(Haykin, 1999) pp. 179--180 antisymmetric activation function

phi(v) = a tanh(bv)

*\

(datatype antisym-activfun

________________________________________
(value a) : number;

________________________________________
(value b) : number;

)

(do
    (set a 1.7159)
    (set b (/ 2.0 3.0))
    [])



(define threshold1
  Activation ->
      (* (value a) (tanh (* (value b) Activation))))


\*

The activation function of the perceptron

The bias, which bias == +1, is handled separately.

Compute:

Sum of inputs * weights + bias (=df (value *BIAS*)) * weight of bias

If the inputs of the neuron come from the samples, then the neuron
inputs IDs are negative, if the inputs of the neuron come from the
inputs, then the inputs IDs are positive.

In the both cases, the input # N -> (abs N) is the pointer to the
vector item to be multiplied with the corresponding weight.

The pins and the pwts fields are assumed to be set fully

*\


(define activation-level
  N ->
    (+
      (activation-level-h
          (getp N pins)     \\ inputs IDs vector, + or -
	  (getp N pins-n)   \\ inputs numeric values
	  (getp N pwts)     \\ the weights IDs
	  (getp N pwts-n)   \\ weights numeric values
	  1 \\ initial value of the counter
	  0 \\ init the sum to zero
	  )
	(* (value *BIAS*) (getp N pbias)))) \\ plus the addition from the bias


\*

Compute the sum of the products of the sample, or input, numbers, and
the weights

*\


(define activation-level-h
  InputsIDs Inputs WeightsIDs Weights Counter Sum ->
      Sum where (> Counter (value *MAXVEC*)) \\ All inputs handled?
  InputsIDs Inputs WeightsIDs Weights Counter Sum ->
      \\ This input is not there:
      (activation-level-h InputsIDs
                          Inputs
			  WeightsIDs
                          Weights
			  (+ 1 Counter)
			  Sum)
              where (= (<-vector InputsIDs Counter) (value *EMPTY*))
  InputsIDs Inputs WeightsIDs Weights Counter Sum ->
      (activation-level-h \\ The input is there:
          InputsIDs
	  Inputs
	  WeightsIDs
	  Weights
	  (+ Counter 1)
	  (+ Sum (* (<-vector Inputs Counter)
	            (<-vector Weights Counter)))))
			    
\*

The number of the output layer is stored in the global var
*last-layer*, set in the function (defneuron ....)

*\


(define fire-synapses
  \\ Launches the axon output synapses, ie sends the output of the
  \\ neuron, in question, into the vec of output neurons, and their
  \\ inputs, as specified in the list of output neuron IDs:
  Neuron ->
  (let
      N (getp Neuron pout)    \\ output number to be sent
      L (getp Neuron pouts)   \\ neuron ID vector to send to
      Ignore (if (= (getp Neuron pnlayer)
                    (value *last-layer*))  \\ Output neuron: Don't fire
                 []
                 (fire-synapses-h Neuron N L 1)) \\ Recurse over pouts
      []))

\*

Iterate through all the vector items, id est thru all the output
neurons, in the sending neuron's pouts list:

Arguments:

Neuron -- Sending neuron symbol

N -- output number to be sent

L -- number vector, of neuron IDs, where to send to, 0 == No Neuron

Counter -- index into the neuron vector L, where to send to

*\


\\ TODO: Fix This



(define fire-synapses-h
    Neuron N L Counter -> [] where (> Counter (value *MAXVEC*)) \\ L OK?
    Neuron N L Counter ->
        (fire-synapses-h Neuron N L (+ 1 Counter))
	    where (= (<-vector L Counter) 0) \\ No Neuron here?
    Neuron N L Counter ->
        (fire-synapses-h Neuron N L (+ 1 Counter))
	    where (= (<-vector (value *obarray*)
	                       (<-vector L Counter))
			(value *EMPTY*)) \\ No Neuron in *obarray*?
    Neuron N L Counter ->
        (let
	  \\ L is the output neurons IDs vector, here nonempty
	    O (<-vector \\ Receiving neuron symbol -> O
                  (value *obarray*)
		  (<-vector L Counter))  \\ Receiving neuron ID, by Counter
	    Ign (fire-synapse-aux Neuron \\ Sending neuron symbol
	                          N      \\ Number 2 be sent
				  O      \\ Receiving neuron symbol
				  Counter \\ Index into sender's pouts
				)
	    Ign (fire-synapses-h Neuron N L (+ 1 Counter)) \\ Recurse
	    []))

\*

Send the output of the synapse by Counter, into the receiving pctron

Arguments:

* Neuron the neuron which is sending, a symbol

* N the number being sent

* O is the output neuron, symbol, not the ID

* Counter is the index within the sender's outputs integer vector
  id est, within her pouts

*\


(define fire-synapse-aux
  Neuron N O Counter ->
    (let
      OIV (getp O pins-n)      \\ old inputs num vector of output neuron
      Ign (vector-> OIV (getp Neuron pnn) N) \\ Number into O's OIV
      NON (putp O OIV pins-n)  \\ New Inputs => New Output Neuron
      NON \\ return the resulting novel neuron
      ))



(define fire-neuron
    N ->
        (do
	    (transfer-function N) \\ Compute the output
	    (fire-synapses N) \\ Outputs over synapses
	    []))


