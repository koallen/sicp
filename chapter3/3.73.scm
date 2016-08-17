;;;; Answer to exercise 3.73

;; modelling the RC circuit
(define (RC R C dt)
  (lambda (i v0)
    (add-streams (scale-stream i R)
                 (integral (scale-stream i (/ 1 C)) v0 dt))))
