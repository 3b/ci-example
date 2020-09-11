(defpackage #:ci-example.test
  (:use #:cl)
  (:local-nicknames (#:x #:ci-example))
  (:export #:run-tests-for-ci))

(in-package #:ci-example.test)

(defun run-tests-for-ci ()
  (handler-case
      (progn
        ;; add any testing that should run in CI here
        (assert (= (x:run 1) 2))
        (unless (= (x:run 2) 3)
          (format t "test failed~%")
          (uiop:quit 124)))
    (error (a)
      (format t "caught error ~s~%~a~%" a a)
      (uiop:quit 125))))

