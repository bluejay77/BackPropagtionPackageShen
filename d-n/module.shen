
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\d-n\\module.shen"

*\


(register-module [[name: d-n]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "compute deltas"]
                  [load-fn: d-n-load]
                  [translate: "d-n.shen"]])



(define d-n-load
  {X --> boolean}
  _ -> (do (load/tc - "d-n.shen")
           ))




