#lang planet neil/sicp
;打印计算时产生的近视值序列

(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
      (print-line guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define (print-line value)
  (display value)
  (newline))
;不用平均阻尼
(define (x-to-the-x y)
  (fixed-point (lambda (x) (/ (log y) (log x)))
               10.0))

;平均阻尼

(define (x-to-the-x y)
  (fixed-point (lambda (x) (average x / (log y) (log x)))
               10.0))