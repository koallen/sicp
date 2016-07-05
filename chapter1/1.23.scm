;;;; Answer to exercise 1.23

;; Define the procedure next
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

;; The ratio is not 2, because we added extra computation by introducing the if special form.
