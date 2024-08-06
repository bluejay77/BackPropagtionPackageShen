
\*

Dr AJY 2019-05-19

The master file to load the backpropagation system

This file is

"/home/juhani/backpropagation/bp/ld.shen"


The author did not use types, they can be added to the software later
on.


TODO:

* The pctron is an abstract datatype.   The neural net itself could be
  an abstract datatype!
  add-neuron forward-computation backpropagate etc...

* the bias: every layer contains one bias neuron, whose output is
  permanently set to +1.0.  Its weights to the other neurons in this
  layer work as the biases moving the sigmoid curve, and are trained
  with the backpragation algorithm.

* print and examine all, until no bugs;

* Scientific question: Will this one run without the biases?
   Tanimoto.  Add the biases, and, their mathematics.  aima-lisp?

*  Add the (Haykin, 1999) momentum constant.  Two functions.

*  print and examine all, until no bugs;

*  two examples: Winston, and Poole-Mackworth

*  Resilient Propagation from the documents;

*  Anastasiadis' Resilient Propagation, with the Wolfe conditions





The bias.

The weights are trainable w/ the back propagation.

One of the inputs of each and every neuron is identically constant,
the (value *BIAS*).  It is usually +1 or -1, in different references.

Modify all of the mathematics accordingly, with a pen and paper.



Handling the biases:

In the file obarray.shen there is there the constant *MAXVEC*, which
gives the max number of numbers in the inputs and the outputs vectors.
Those vectors are actually *MAX* == (+ 1 *MAXVEC*) items long.  The
input item #MAX is the (value *BIAS*), and the weight #MAX is the
trainable weight of the bias, which bias is a constant.


The multilayer perceptron with the error backpropagation algorithm
(Winston, 1992), (Haykin, 1999), (Luger, 2002), (Luger, 2009), (ICNN,
1994), (IEEE, 2005)

The above references:

(Winston, 1992) Patrick Henry Winston: Artificial Intelligence, 3rd
edition Addison-Wesley 1992, ISBN 0-201-53377-4

(Haykin, 1999) Simon Haykin: NEURAL NETWORKS, A Comprehensive
Foundation the author has the 2nd edition Prentice--Hall 1999, ISBN
0-13-273350-1.  and that the reader delve into Chapters 1--4.

(Luger, 2002) George F Luger: Artificial Intelligence,
Pearson--Addison-Wesley, the author has the 4th edition, ISBN
0-201-64866-0.
  
(Luger, 2009) George F. Luger: ARTIFICIAL INTELLIGENCE, 6th Edition;
Pearson--Addison-Wesley 2009, ISBN 978-0-13-209001-8.

(ICNN, 1994)

(IEEE, 2005) See http://ieeexplore.ieee.org/document/1007668/

Learning by the backpropagation algorithm: Allen B Tucker: Comp Sci
Handbook ISBN 1-58488-360-X p. 66-11 conjugate gradients quasi-Newton
(variable metric) sum-of-squares cost function: Levenberg-Marquardt
algorithm

The ANN example here is from the (Winston, 1992) from Pages 458--465.
The author has made two changes to the Winston example: The ANN
neurons have biases, as it is customary in the ANN applications.  And
moreover, we use the momentum constant, as in (Haykin, 1999) and
(ICNN, 1994).

(Anastasiadis, 2005) resilient backpropagation formulas.  And the
Wolfe condtions, from the literature



---Algorithm:

(Haykin, 1999) pp. 173--175.

Phase 1.  Initialization.

Pick synaptic weights and thresholds from a uniform distribution,
whose mean == 0, and whose variance is given as a function parameter.
See (Haykin, 1999) p. 174.

Iterate UNTIL (stopping criterion):

    Phase 1.  Randomize the order of the training samples.

    Iterate for all the training samples:

        Phase 2.  Present (assign) one training example.  For this epoch.

        Phase 3.  Forward computation.  Self explanatory.

        Phase 4.  Backward Computation.  Compute the betas, deltas, sumDeltas.

    End Iteration for One Training Sample

END UNTIL

The order of presentation of training examples should be randomized
from epoch to epoch.

Four epoch iteration stopping criteria:

1.  Number of epochs given, e. g. (bprop 200)

2.  (Winston, 1992) <0.1 or >0.9 criterion, e. g. (cbprop)

3.  (Haykin, 1999) p. 173 criterion -- Euclidean norm of the gradient
of the error surface is sufficiently small, and is given as a function
argument (h1bprop 0.01)

4.  (Haykin, 1999) p. 173 criterion 2: absolute rate of change in the
average squared error per epoch is sufficiently small, is given as a
function parameter, (h2bprop 0.001)



Use the sequential mode: Update the weights after the presentation of
each training example.  (Haykin, 1999) p. 171-172.

Apply the (Anastasiadis, 2005) resilient backpropagation algorithm.



*\




(do
  (load "/home/juhani/backpropagation/bp/modulesys.shen")
  (module.add-path "/home/juhani/backpropagation/bp/")
  (module.add-path "/home/juhani/backpropagation/bp/maths-lib/")
  (use-modules ["maths-lib"])
  (module.add-path "/home/juhani/backpropagation/bp/abstract/")
  (use-modules ["abstract"])
  (module.add-path "/home/juhani/backpropagation/bp/bputp/")
  (use-modules ["bputp"])
  (module.add-path "/home/juhani/backpropagation/bp/random/")
  (use-modules ["random"])
  (module.add-path "/home/juhani/backpropagation/bp/random-weight/")
  (use-modules ["random-weight"])
  (module.add-path "/home/juhani/backpropagation/bp/record/")
  (use-modules ["record"])
  (module.add-path "/home/juhani/backpropagation/bp/aux1/")
  (use-modules ["aux1"])
  (module.add-path "/home/juhani/backpropagation/bp/xfer/")
  (use-modules ["xfer"])
  (module.add-path "/home/juhani/backpropagation/bp/for-all/")
  (use-modules ["for-all"])
  (module.add-path "/home/juhani/backpropagation/bp/zero/")
  (use-modules ["zero"])
  (module.add-path "/home/juhani/backpropagation/bp/train/")
  (use-modules ["train"])
  (module.add-path "/home/juhani/backpropagation/bp/assign/")
  (use-modules ["assign"])
  (module.add-path "/home/juhani/backpropagation/bp/launch/")
  (use-modules ["launch"])
  (module.add-path "/home/juhani/backpropagation/bp/b-out/")
  (use-modules ["b-out"])
  (module.add-path "/home/juhani/backpropagation/bp/b-1/")
  (use-modules ["b-1"])
  (module.add-path "/home/juhani/backpropagation/bp/d-1/")
  (use-modules ["d-1"])
  (module.add-path "/home/juhani/backpropagation/bp/d-n/")
  (use-modules ["d-n"])
  (module.add-path "/home/juhani/backpropagation/bp/change/")
  (use-modules ["change"])
  \\
  \\Load the application data
  (load "./bapp.shen")         
  [])


