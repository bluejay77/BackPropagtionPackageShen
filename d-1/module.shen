
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\d-1\\module.shen"

*\


(register-module [[name: d-1]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Deltas #1"]
                  [load-fn: d-1-load]
                  [translate: "d-1.shen"]])



(define d-1-load
  {X --> boolean}
  _ -> (do (load/tc - "d-1.shen")
           ))




