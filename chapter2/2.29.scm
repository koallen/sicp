;;;; Answer to exercise 2.29

;; section a: selectors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; section b: total-weight
(define (total-weight mobile)
  (cond ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

;; section c: balanced?
(define (balanced? mobile)
  (if (not (pair? mobile))
      #t
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (* (branch-length left) (total-weight (branch-structure left)))
                (* (branch-length right) (total-weight (branch-structure right))))
             (balanced? (branch-structure left))
             (balanced? (branch-structure right))))))

;; section d

;; Nothing much need to be changed. Just change how we access the right element from (car (cdr ))
;; to (cdr )
