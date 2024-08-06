\*

Dr AJY 2018-01-30

*\


\\ Auxiliary functions for the error backpropagation ANN software
\\ Try (out-neurons)
\\ Try (show-samples)
\\ Try (out-layers)


(define dsp
    ->
    (do
        (output "~%The output layer is: ~A~%"
	    (value *last-layer*))
        (dsp-h (value *Samples*)) []))


(define dsp-h
    [] -> []
    [H | T] ->
        (do
	    (display-sample H)
	    (dsp-h T) \\ Recurse
	    []))


(define o-neuron
  N ->
      (do
          (output "~A" (getp N pdoc))
          (output "  ID: ~A  " (getp N pnn))
          (output "  Output: ~A~%" (getp N pout))))



(define out-neurons-layer
    Vec Indx -> [] where (> Indx (value *MAXINLAYER*))
    Vec Indx -> (out-neurons-layer Vec (+ 1 Indx))
                    where (= (<-vector Vec Indx) (value *EMPTY*))
    Vec Indx ->
        (do
	    (o-neuron (<-vector Vec Indx))
	    (out-neurons-layer Vec (+ 1 Indx))))

(define out-layers
  -> (out-layers-h (value *ANN*) 1))


(define out-layers-h
  ANN Indx -> [] where (> Indx (value *MAXLAYERS*))
  ANN Indx ->
      (do
       (out-neurons-layer (<-vector ANN Indx) 1)
       []))



(define display-sample
    H ->
        (let
	    Ign (output "~%Sample:~%")
	    Ign (output "~A~%" H)
            V (vector (value *MAXVEC*))
            V (fill-vec V (hd H) 1 )
            Ign (assign-inputs V) \\ Take current sample into the *ANN*
	    Ign (launch-ann) \\ Fire the entire net
	    ONS (<-vector (value *ANN*)
	                 (value *last-layer*))
	    Ign (out-neurons ONS 1)
	    Ign (output "~%")
	    []))



(define show-samples
    -> (do (show-samples-h (value *Samples*)) []))


(define show-samples-h
    [] -> []
    [H | T] ->
        (do
	    (show-sample-aux H)
	    (show-samples-h T)
	    []))


(define show-sample-aux
    S ->
        (do
	    (output "~%~%Sample:~%")
	    (output "~A~%" S)
	    []))
