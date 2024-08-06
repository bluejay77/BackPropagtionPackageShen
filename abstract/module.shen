
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\abstract\\module.shen"

*\


(register-module [[name: abstract]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "The neuron as an abstract datatype"]
                  [load-fn: abstract-load]
                  [translate: "abstract.shen"]])



(define abstract-load
  {X --> boolean}
  _ -> (do (load/tc - "abstract.shen")
           ))




