(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (if (= (length (sound n)) 0)
      (format nil "~a" n)
      (sound n))
  )

(defun sound (n)
  (concatenate 'string
    (when (= (mod n 3) 0) "Pling")
    (when (= (mod n 5) 0) "Plang")
    (when (= (mod n 7) 0) "Plong"))
  )