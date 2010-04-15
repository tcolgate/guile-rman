#!/usr/bin/guile -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; test - Simple test script for the guile-rman wrapper
;;
;;-------------------------------------------------------------------

(use-modules (unit-test)
             (oop goops)
             (rman ri2rib))

(define-class <test-rispec> (<test-case>))

(define-method (test-rispec-basic (self <test-rispec>))
  (RiBegin "test")
  (RiWorldBegin)
  (RiAttributeBegin)
  (let(( a #f32( 0.1 0.2 0.3)))
    (RiColor a)
    (RiTransform #2f32((0.1 1.0 1.0 1.0)
                       (1.0 1.0 1.0 1.0)
                       (1.0 1.0 1.0 1.0)
                       (1.0 1.0 1.0 1.0)))
    (RiSurface "shinymetal" '("uniform string texturename" "test.tif" )))
  (RiAttributeEnd)
  (RiWorldEnd)
  (RiEnd))


(exit-with-summary (run-all-defined-test-cases))

