
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\obarray\\module.shen"

*\


(register-module [[name: obarray]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "properties"]
                  [load-fn: obarray-load]
                  [translate: "obarray.shen"]])



(define obarray-load
  {X --> boolean}
  _ -> (do (load/tc - "obarray.shen")
           ))




