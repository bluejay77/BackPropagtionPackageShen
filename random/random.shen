\*

Dr AJY 2018-01-06

*\

\\ The Linear Congruential Random Number Generator (LCRNG) as an
\\ abstract datatype after Professor D E Knuth
\\
\\ Dr A. J. Y.  2016-11-22
\\
\\ https://en.wikipedia.org/wiki/Random_number_generation
\\
\\ https://en.wikipedia.org/wiki/Linear_congruential_generator
\\
\\ The very basic algorithm (rand) gives random integers in the range
\\ [0, (power 2 64))
\\
\\ The function (random) gives random reals in the range
\\ [0, 1)
\\
\\ Usage:
\\ (load "maths-lib1.shen")
\\ (load "random.shen")
\\
\\ ------------------------------------------------------------
\\ From the Wikipedia:
\\ 
\\ The generator is defined by the recurrence relation:
\\ 
\\ X(n+1) = (a * X(n) + c) MOD m
\\ where X(i) is the sequence of pseudorandom values, and
\\ 
\\  m,  0 < m  -- the "modulus"
\\  a, 0 < a < m -- the "multiplier"
\\  c, 0 <= c < m -- the "increment"
\\  X(0), 0 <= X(0) < m -- the "seed" or "start value"
\\
\\
\\ MMIX by Professor Donald Erwin Knuth had the values:
\\
\\ m = (power 2 64)
\\ a = 6364136223846793005
\\ c = 1442695040888963407
\\
\\ I have chosen them for this random number generator
\\
\\ This one will work in the SBCL and CLISP implementations of Shen
\\ since they have bignums.
\\ For other ones, it will be necessary to find out about that point.
\\
\\ Usage:
\\ First do
\\
\\ (set rng (mk-g <the seed integer>))
\\
\\ Then repeatedly call
\\
\\ (set rng (rand (value rng)))
\\ (set rng (rand (value rng)))
\\ (set rng (rand (value rng)))
\\ ........ for random integers,
\\
\\ or:
\\
\\ (random)
\\ (random)
\\ (random)
\\ ........ for random real numbers in the interval [0, 1)
\\
\\ ------------------------------------------------------------




(datatype g \\ a random number stream generator

State: number;
==================================================
State: g;

__________________________________________________
mk-g: (number --> g);

__________________________________________________
rand: (g --> g); \\ random integers

__________________________________________________
val: (g --> number); \\ the value of the state

__________________________________________________
random: (--> number); \\ random numbers in [0, 1)

)


(define mk-g
    { number --> g }
    State -> State)


(define rand
    { g --> g }
    \\  X(n+1) = (a * X(n) + c) MOD m
    State ->
    (let New-x (mod (+ (* State      \\ X(n)
                          6364136223846793005) \\ a
		       1442695040888963407)    \\ c
		    (power 2 64))              \\ m

         New-x))                     \\ Return X(n + 1)


(define val
    { g --> number }
    State -> State)


(datatype rng

__________________________________________________
(value rng): g;

)



(set rng (mk-g (get-time unix))) \\ Random initialization


\\ The real valued function (random) gives one random
\\ real number in the interval [0, 1)

(define random
    { --> number }
    ->
    (do
        (set rng (rand (value rng)))
        (/ (val (value rng)) (power 2 64))))



\\ Then
\\ (random)
\\ (random)
\\ (random)
\\ ...

