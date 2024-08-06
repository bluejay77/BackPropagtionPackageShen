
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\defneuron\\module.shen"

*\


(register-module [[name: defneuron]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "define one neural net neuron"]
                  [load-fn: defneuron-load]
                  [translate: "defneuron.shen"]])



(define defneuron-load
  {X --> boolean}
  _ -> (do (load/tc - "defneuron.shen")
           ))




