;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; file.scm - Some info 
;;
;;-------------------------------------------------------------------

(use-modules (oop goops))
(use-modules (rman aqsisnv))
(define dict (make <CqTokenDictionary> #:args '(#t)))
(parseAndLookup dict "uniform string test")
(insert dict (parseAndLookup dict "uniform string test"))
(catch 
  #t
  (lambda()
    (parseAndLookup dict "notdeclare"))
  (lambda (key . args)
    (display Caught)
    (newline)))
