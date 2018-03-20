#lang planet neil/sicp
(define (small-div n)
  (define (devides? a b)
    (= 0 (remainder b a)))
  (define (find-div n test)
    (cond ((> (sq test) n) n) ((divides? test n) test)
          (else (find-div n (+ test 1)))))
  (find-div n 2))

(define (prime? n)
  (if (= n 1) false
      (= n (small-div n))))

 (define (filtered-accumulator filter combiner null-value term a next b) 
   (if (> a b) null-value 
     (combiner (if (filter a) (term a) 
                 null-value) 
               (filtered-accumulator filter combiner null-value term (next a) next b)))) 