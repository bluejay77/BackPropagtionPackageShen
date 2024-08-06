
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\launch\\module.shen"

*\


(register-module [[name: launch]
                  [author: "Dr Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "Fire neural net"]
                  [load-fn: launch-load]
                  [translate: "launch.shen"]])



(define launch-load
  {X --> boolean}
  _ -> (do (load/tc - "launch.shen")
           ))




