;;;; Answer to exercise 3.30

;; ripple adder
(define (ripple-carry-adder A B S C)
  (define (make-carry lst num)
    (if (= num 0)
        lst
        (make-carry (cons (make-wire) lst) (- num 1))))
  (let ((carrys (make-carry '() (length A))))
    (define (connect A B S C carrys)
      (if (null? (cdr A))
          ;; carry-out connects to C
          (full-adder (car A) (car B) (car carrys) (car S) C)
          ;; carry-out connects to next full adder's carry-in
          (begin (full-adder (car A) (car B) (car carrys) (car S) (cadr carrys))
                 (connect (cdr A) (cdr B) (cdr S) C (cdr carrys)))))
    (connect A B S C carrys)
    (set-signal! (car carrys) 0)))
