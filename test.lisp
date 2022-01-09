(defpackage #:ci-example.test
  (:use #:cl)
  (:local-nicknames (#:x #:ci-example))
  (:export #:run-tests-for-ci
           #:run-tests-for-ci2))

(in-package #:ci-example.test)

(defun run-tests-for-ci ()
  ;; error on failure
  (assert (= (x:run 1) 2))
  (assert (= (x:run 2) 3))
  ;; if all tests passed, return T
  t)

(defun run-tests-for-ci2 ()
  ;; or run multiple tests and report how many passed
  (let ((ok 0)
        (failed 0))
    (flet ((try (x) (if x (incf ok) (incf failed))))
      (try (= (x:run 3) 4))
      (try (= (x:run 4) 5))
      (loop repeat 4 for i from 10 for j from 11 (try (= (x:run i) j)))))
  (format t "passed ~s, failed ~s~%")
  ;; return NIL if there were failures, so CI will fail
  (= failed 0))

