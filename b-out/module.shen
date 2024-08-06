
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\b-out\\module.shen"

*\


(register-module [[name: b-out]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "betas #1"]
                  [load-fn: b-out-load]
                  [translate: "b-out.shen"]])



(define b-out-load
  {X --> boolean}
  _ -> (do (load/tc - "b-out.shen")
           ))




