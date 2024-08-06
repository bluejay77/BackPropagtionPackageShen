
\*

This file is "c:\\users\\antti\\bp\\bp\\bp\\maths-lib\\module.shen"

*\


(register-module [[name: maths-lib]
                  [author: "Willi O Riha, Antti J Ylikoski"]
                  [license: "commercial"]
                  [desc: "mathematics library"]
                  [load-fn: maths-load]
                  [translate: "maths-lib.shen"]])



\* load native definitions of math functions for efficiency *\
(define maths-load-native
  {string --> string --> boolean}
  _ _ -> true)




(define maths-load
  {X --> boolean}
  _ -> (do (load/tc - "macro-def.shen")
           (load "maths-lib.shen")
           (maths-load-native (language) (implementation))))
