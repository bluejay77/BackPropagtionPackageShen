
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\for-all\\module.shen"

*\


(register-module [[name: for-all]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "aux higher function"]
                  [load-fn: for-all-load]
                  [translate: "for-all.shen"]])



(define for-all-load
  {X --> boolean}
  _ -> (do (load/tc - "for-all.shen")
           ))




