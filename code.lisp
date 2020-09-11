(defpackage #:ci-example
  (:use #:cl)
  (:export #:run))

(in-package #:ci-example)

(defun run (x)
  (+ 1 x))
