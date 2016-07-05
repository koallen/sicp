;;;; Answer to exercise 1.28

;; Define the modified expmod procedure
(define (expmod base exp m)
  (define (signal n)
    (define (check-nontrivial-sqrt n square)
      (if (and (not (= n 1))
               (not (= n (- m 1)))
               (= square 1))
          0
          square))
    (check-nontrivial-sqrt n (remainder (square n) m)))
  (cond ((= exp 0) 1)
        ((even? exp) (signal (expmod base (/ exp 2) m)))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

;; Define Miller-Rabin test
(define (miller-rabin-test m)
  (define (try-it a)
    (= (expmod a (- m 1) m) 1))
  (try-it (+ 1 (random (- m 1)))))

;; Define fast prime
(define (fast-prime m times)
  (cond ((= times 0) #t)
        ((miller-rabin-test m) (fast-prime m (- times 1)))
        (else #f)))
