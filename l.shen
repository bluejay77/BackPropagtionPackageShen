
\*

AJY 2019-04-17

The master file to load the backpropagation system

This file is

"c:\\users\\antti\\bp\\bp\\bp\\l.shen"



TODO:

1  modules -- being prepared

2  bias

3  RPROP

4  final checks

5  Example Poole-Mackworth, book file

6  Anastasiadis rprop




*\

(do
  (load "c:\\users\\antti\\bp\\bp\\bp\\modulesys.shen")
  (module.add-path "c:\\users\\antti\\bp\\bp\\bp\\")
  (module.add-path "c:\\users\\antti\\bp\\bp\\bp\\maths-lib\\")
  (use-modules ["maths-lib"])
  (module.add-path "c:\\users\\antti\\bp\\bp\\bp\\bputp\\")
  (use-modules ["bputp"])
  (module.add-path "c:\\users\\antti\\bp\\bp\\bp\\obarray\\")
  (use-modules ["obarray"])
  [])


