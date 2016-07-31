;;;; Answer to exercise 2.81

;; a.
;; The apply-generic procedure will loop forever.

;; b.
;; The original implementation is correct. If the operation cannot be carried out with types of 
;; the two arguments, and they cannot be coerced, error will be shown.

;; c.
;; Just add a if to test whether the two arguments have the same type before trying to coercing them.
