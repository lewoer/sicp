#lang planet neil/sicp
(define (square x) (* x x))
(define (compose f g) (lambda (x) (f (g x))))

;(define (repeat f n)
;  (if (< n 1)
;      (lambda (x) x)
;      (compose f (repeat f (- n 1)))))
;((repeat square 2) 5)

;迭代版本的
;identity不知道是什么，以后再来补齐知识
(define (repeat-iter f n)
  (define (iter n result)
    (if (< n 1)
        result
        (iter (- n 1) (compose f result))))
  (iter n identity))
((repeat-iter square 2) 5)