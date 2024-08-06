
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\zero\\module.shen"

*\


(register-module [[name: zero]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Zero data structures"]
                  [load-fn: zero-load]
                  [translate: "zero.shen"]])



(define zero-load
  {X --> boolean}
  _ -> (do (load/tc - "zero.shen")
           ))




