
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\aux1\\module.shen"

*\


(register-module [[name: aux1]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "various auxiliary"]
                  [load-fn: aux1-load]
                  [translate: "aux1.shen"]])



(define aux1-load
  {X --> boolean}
  _ -> (do (load/tc - "aux1.shen")
           ))




