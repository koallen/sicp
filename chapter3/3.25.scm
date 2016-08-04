;;;; Answer to exercise 3.24

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    ;; we define assoc internally and use same-key? as predicate
    (define (assoc key records)
      (cond ((null? records) #f)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key-list)
      (define (iter key-list table)
        (if (null? key-list)
            (cdr table)
            (let ((record (assoc (car key-list) (cdr table))))
              (if record
                  (iter (cdr key-list) record)
                  #f))))
      (iter key-list local-table))
    (define (insert! key-list value)
      (define (iter key-list table)
        (if (null? key-list)
            (set-cdr! table value)
            (let ((record (assoc (car key-list) (cdr table))))
              (if record
                  (iter (cdr key-list) record)
                  (begin (set-cdr! table
                                   (cons (list (car key-list))
                                         (cdr table)))
                         (iter (cdr key-list) (cadr table)))))))
      (iter key-list local-table))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unkown operation -- TABLE" m))))
    dispatch))

(define (get table key-list)
  ((table 'lookup-proc) key-list))

(define (put table key-list value)
  ((table 'insert-proc!) key-list value))
