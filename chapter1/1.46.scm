;;;; Answer to exercise 1.46

;; Define iterative-improve
(define (iterative-improve good-enough? improve)
  (lambda (guess)
          (if (good-enough? guess)
              guess
              ((iterative-improve good-enough? improve) (improve guess)))))

;; Define sqrt and fixed-point with iterative-improve
(define (sqrt x)
  ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.0001))
                      (lambda (y) (/ (+ (/ x y) y) 2)))
   1.0))

(define (fixed-point f init-guess)
  ((iterative-improve (lambda (guess) (< (abs (- (f guess) guess)) 0.00001))
                      f)
   init-guess))
