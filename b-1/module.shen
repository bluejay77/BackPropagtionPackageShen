
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\b-1\\module.shen"

*\


(register-module [[name: b-1]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Betas"]
                  [load-fn: b-1-load]
                  [translate: "b-1.shen"]])



(define b-1-load
  {X --> boolean}
  _ -> (do (load/tc - "b-1.shen")
           ))




