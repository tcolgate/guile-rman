#!/usr/bin/guile -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; test - Simple test script for the guile-rman wrapper
;;
;;-------------------------------------------------------------------
;;
(use-modules (rman rispec))
(use-modules (rman utilities))

(RIB "test"
  (RiDeclare "test" "uniform string[3]")
  (World 
    (Attribute
      (let(( a #f32(0.1 0.2 0.3))
           (o1 (Object (RiSphere 1.0 0.0 1.0 1.0))))
        (RiColor a)
        (RiTransform #2f32((0.1 1.0 1.0 1.0)
                           (1.0 1.0 1.0 1.0)
                           (1.0 1.0 1.0 1.0)
                           (1.0 1.0 1.0 1.0)))
        (RiObjectInstance o1)
        (RiSurface "constant" '("test" "hello"))
))))

