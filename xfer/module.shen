
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\xfer\\module.shen"

*\


(register-module [[name: xfer]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "transfer"]
                  [load-fn: xfer-load]
                  [translate: "xfer.shen"]])



(define xfer-load
  {X --> boolean}
  _ -> (do (load/tc - "xfer.shen")
           ))




