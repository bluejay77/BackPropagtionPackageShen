\*

The perceptron as a Shen abstract datatype

Dr AJY 2019-06-11


*\




(datatype pctron

NN : string;
Doc : string;
Ins : (list (list any)); \\ [ [ Input Where-From ] [ Input Where-From ]...]
Wts : (list (list any)); \\ [ [ Weight Where-From ] [ Weight Where-From ]..]
Bias: number;                   \\ the weight of the bias of this neuron
Del : (list (list any)); \\ [ [ Delta-Weight Where-From ] ...]
SDel: (list (list any)); \\ [ [ Accumulated-Del Where-From ] ...]
Act : number;
Out : number; \\ computed output number
B : number; \\ the error backpropagation beta for this neuron
Outs : (list string); \\ list of output neuron names to send to
===========================================
[
    NN
    Doc
    Ins
    Wts
    Bias
    Del
    SDel
    Act
    Out
    B
    Outs] : pctron;

)

\*

Data type for the defneuron function

*\




(define mk-pctron
    { string -->              \\ Symbolic name of this neuron
      string -->              \\ Text documentation of neuron
      (list (list any)) -->  \\ The inputs,
	                      \\ list [ [ input1 neuron-from ]
                              \\        [ input2 neuron-from ] ]
      (list (list any)) -->  \\ The weights, a similar list
      number -->              \\ the bias
      (list (list any)) -->  \\ Changes to weights, needed by the
                              \\ perceptron backpropagation algorithm
      (list (list any)) -->  \\ Sums of changes to weights
      number -->              \\ The computed activation
      number -->              \\ The output, after the threshold function
      number -->              \\ The backpropagation beta for this neuron
      (list string)           \\ A list of output neurons to send to


        -->
	    pctron }

    NN
    Doc
    Ins
    Wts
    Bias
    Del
    SDel
    Act
    Out
    B
    Outs
        ->
	    [
                NN
		Doc
		Ins
		Wts
		Bias
		Del
		SDel
		Act
		Out
		B
		Outs])


