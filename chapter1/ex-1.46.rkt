#lang planet neil/sicp
;迭代式改进，从答案的初始猜测开始，检查这一猜测是否足够好，如果不行就改进，改进后的猜测继续作为新的猜测。
(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (iter n)
      (if (good-enough? n)
          n
          (iter (improve n))))
    (iter x)))