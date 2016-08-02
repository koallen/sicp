;;;; Answer to exercise 3.4

;; password-protected account with cop support
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (call-the-cops) "Cops are called")

  (let ((incorrect-access 0))
    (define (dispatch passwd m)
      (if (eq? passwd password)
          (begin (set! incorrect-access 0)
                 (cond ((eq? m 'withdraw) withdraw)
                       ((eq? m 'deposit) deposit)
                       (else (error "Unknown request -- MAKE-ACCOUNT" m))))
          (if (= incorrect-access 7)
              (lambda (x) (call-the-cops))
              (lambda (x) (begin (set! incorrect-access (+ incorrect-access 1))
                                 "Incorrect password")))))
    dispatch))
