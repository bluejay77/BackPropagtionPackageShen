
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\change\\module.shen"

*\


(register-module [[name: change]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Change numeric values"]
                  [load-fn: change-load]
                  [translate: "change.shen"]])



(define change-load
  {X --> boolean}
  _ -> (do (load/tc - "change.shen")
           ))




