\*

Define putp and getp according to the MACLISP model

*\



(datatype unit
 _________
A : (mode unit -);) \\ Credits to Mark Thom and Mark Tarver


(datatype props

Obj: unit;
Val: unit;
Prop: unit;
==============================
(put Obj Val Prop): unit;


Obj: unit;
Val: unit;
==============================
(get Obj Val): unit;

)


(define putp
    { symbol --> unit --> symbol --> unit }
    Obj Val Prop ->
        (put Obj Prop Val))

(define getp
    { symbol --> symbol --> unit }
    Obj Prop ->
        (get Obj Prop))

