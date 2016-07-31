;;;; Answer to exercise 2.74

;; procedures for headquarters
(define (get-record file name)
  ((get 'record (type-tag file)) name))

(define (get-salary employee)
  ((get 'salary (type-tag employee)) employee))

(define (find-employee-record name files)
  (if (null? files)
      '()
      (cons (get-record (car files) name)
            (find-employee-record name (cdr files)))))

;; for the above procedures to work, each division must tag their file and records with their division name.
;; and they need to install it to the table for headquarters to use.

;; when a new company is taken over, make sure to install their procedures to the table.
