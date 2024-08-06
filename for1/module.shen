
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\abstract\\module.shen"

*\


(register-module [[name: for1]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "The Shen for"]
                  [load-fn: for1-load]
                  [translate: "for1.shen"]])



(define for1-load
  {X --> boolean}
  _ -> (do (load/tc - "for1.shen")
           ))




