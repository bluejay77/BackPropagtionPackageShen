
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\record\\module.shen"

*\


(register-module [[name: record]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "remember neural net data"]
                  [load-fn: record-load]
                  [translate: "record.shen"]])



(define record-load
  {X --> boolean}
  _ -> (do (load/tc - "record.shen")
           ))




