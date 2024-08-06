
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\train\\module.shen"

*\


(register-module [[name: train]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Train the neural net"]
                  [load-fn: train-load]
                  [translate: "train.shen"]])



(define train-load
  {X --> boolean}
  _ -> (do (load/tc - "train.shen")
           ))




