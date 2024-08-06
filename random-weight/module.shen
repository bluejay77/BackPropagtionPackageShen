
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\random-weight\\module.shen"

*\


(register-module [[name: random-weight]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Random initial weights"]
                  [load-fn: random-weight-load]
                  [translate: "random-weight.shen"]])



(define random-weight-load
  {X --> boolean}
  _ -> (do (load/tc - "random-weight.shen")
           ))




