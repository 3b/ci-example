(asdf:defsystem #:ci-example
  :depends-on (#:alexandria)
  :serial t
  :components  ((:file code.lisp)))

(asdf:defsystem #:ci-example.test
  :depends-on (#:ci-example)
  :serial t
  :components ((:file test.lisp)))
