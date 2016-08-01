;;;; Answer to exercise 2.85

;; drop
(define (drop arg)
  (let ((projected-arg (project arg)))
   (if (equ? arg (raise projected-arg))
       (drop projected-arg)
       arg)))

;; project
(define (project x) (apply-generic 'project x))

;; in complex number package, we define
(define (project x)
  (make-real (real-part x)))

(put 'project 'complex project)

;; in real number package, we define
(define (project x)
  (let ((rational-num (inexact->exact x)))
    (make-rat (numerator rational-num)
              (denominator rational-num))))

(put 'project 'real project)

;; in rational number package, we define
(define (project x)
  (round (/ (numer x) (denom x))))

(put 'project 'rational project)

;; modified apply-generic procedure
(define (apply-generic op . args)
  ;; a procedure to get the level of a type in the tower
  (define (tower-level type)
    (cond ((eq? type 'integer) 1)
          ((eq? type 'rational) 2)
          ((eq? type 'real) 3)
          ((eq? type 'complex) 4)))
  ;; successive-raise procedure
  (define (successive-raise arg target-tag)
    (if (eq? (type-tag arg) target-tag)
        arg
        (successive-raise (raise arg) target-tag)))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          ;; drop to simplest form here
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((type1-level (tower-level type1))
                      (type2-level (tower-level type2)))
                  (cond ((> type1-level type2-level)
                         (apply-generic op a1 (successive-raise a2 type1)))
                        ((= type1-level type2-level)
                         (error "No method for these types -- APPLY-GENERIC" (list op type-tags)))
                        ((< type1-level type2-level)
                         (apply-generic op (successive-raise a1 type2) a2)))))
              (error "No method for these types -- APPLY-GENERIC" (list op type-tags)))))))
