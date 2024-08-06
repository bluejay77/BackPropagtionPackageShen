
(package bp [bprop cbprop show-samples spprint dsp record-samples
             random]


\* Master file to load the backpropagation program files


(C) Dr A. J. Y. 2018-01-16 --


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

Learning by the backpropagation algorithm:
Allen B Tucker: Comp Sci Handbook ISBN 1-58488-360-X p. 66-11
conjugate gradients
quasi-Newton (variable metric)
sum-of-squares cost function: Levenberg-Marquardt algorithm

The ANN example here is from the (Winston, 1992) from Pages 458--465.
The author has made two changes to the Winston example: The ANN
neurons have biases, as it is customary in the ANN applications.  And
moreover, we use the momentum constant, as in (Haykin, 1999) and
(ICNN, 1994).
  
Another example: Example Fig 7.11 p. 317 Poole-Mackworth book
ARTIFICIAL INTELLIGENCE, Cambridge: Another ANN from the
literature.  This one comes as an exercise for the reader.

---Algorithm:

(Haykin, 1999) pp. 173--175.

Phase 1.  Initialization.

Pick synaptic weights and thresholds from a uniform distribution,
whose mean == 0, and whose variance is given as a function parameter.
See (Haykin, 1999) p. 174.

Iterate UNITL (stopping criterion):

    Phase 2.  Present (assign) the training examples.  For this epoch.

    Phase 3.  Forward computation.  Self explanatory.

    Phase 4.  Backward Computation.  Compute the betas, deltas, sumDeltas.

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


\*

Load the succession of files

*\


(do
    (load "maths-lib1.shen") \\ AJY 2018-05-15
    (load "bputp.shen")      \\ AJY 2018-05-15
    (load "oblist.shen")     \\ AJY 2018-05-15
    (load "random.shen")     \\ AJY 2018-05-15
    (load "record.shen")     \\ AJY 2018-05-15
    (load "defneuron.shen")  \\ AJY 2018-05-15---
    (load "spprint.shen")    \\ AJY 2018-05-15
    (load "aux1.shen")
    (load "xfer.shen")
    (load "for-all.shen")
    (load "iter.shen")
    (load "assign.shen")
    (load "launch.shen")
    (load "b-out.shen")
    (load "b-l.shen")
    (load "d-1.shen")
    (load "d-n.shen")
    (load "sum.shen")

    []
    )

\*

Do exemplaris gratis:

(load "lbp.shen")

and then:

(time (bprop 100))
or
(cbprop)

(dsp)
(spprint (value *A*))
(show-samples)

*\

\*


\\ Exercise #1 to the reader: Carry out the Exercise 10.8.3. from 
\\ (Luger, 2002) on Page 468.
\\ Note that the backpropagation net in Figure 10.12 on Page 437, Luger,
\\ has a format slightly different from the ordinary multilevel
\\ backpropagation ANN, and therefore some nontrivial programming
\\ by the reader is required.

\\ Exercise #2 to the reader: Program the well-known "Learn the XOR
\\ Function Problem", with an ordinary multilevel backpropagation net.
\\ How many layers (strata) will the reader need?



*\



)

