
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\bputp\\module.shen"

*\


(register-module [[name: bputp]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "properties"]
                  [load-fn: bputp-load]
                  [translate: "bputp.shen"]])



(define bputp-load
  {X --> boolean}
  _ -> (do (load/tc - "bputp.shen")
           ))




