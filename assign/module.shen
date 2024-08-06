
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\assign\\module.shen"

*\


(register-module [[name: assign]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Assign the NN"]
                  [load-fn: assign-load]
                  [translate: "assign.shen"]])



(define assign-load
  {X --> boolean}
  _ -> (do (load/tc - "assign.shen")
           ))




