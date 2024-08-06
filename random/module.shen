
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\random\\module.shen"

*\


(register-module [[name: random]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "LGRNC random numbers"]
                  [load-fn: random-load]
                  [translate: "random.shen"]])



(define random-load
  {X --> boolean}
  _ -> (do (load/tc - "random.shen")
           ))




