#!/usr/bin/guile -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; test2.scm - An exaple excersizing some of the RiSpec callback
;; functions
;;
;;-------------------------------------------------------------------

(use-modules (rman rispec))
(use-modules (rman utilities))

(define (progress percent frame)
  (display "Percent: ")
  (display percent)
  (display " Frame: ")
  (display frame)
  (newline))

(define (subdiv ptr lod)
  (display "Ptr: ")
  (display ptr)
  (display " Lod: ")
  (display lod)
  (newline))

(define (free ptr)
  (display "Ptr: ")
  (display ptr)
  (newline))

(define bound #f32(0.0 0.0 0.0 10.0 10.0 10.0))

(define data '(some data))

(define count 1)
(define myfilter
  (lambda(a b c d)
    (let ((val (RiBoxFilter a b c d)))
      (set! count (+ count 1))
      (display "calling filter ")
      (display a)(display " ")
      (display b)(display " ")
      (display c)(display " ")
      (display d)(display " ")
      (display "equaled ")
      (display val)(newline)
      val)))

(define myfilter2
  (lambda(a b c d)
    (display "pixel filter called")
    1))

(RIB "test"
  (RiDisplay "sphere1.tif" "file" "rgb")
  (RiFormat 320 240 1)
  (RiProjection "perspective" '("fov" 45.0))
  (RiTranslate 0 0 6)
  (RiProgressHandler progress)
  (RiPixelFilter myfilter 2 2)
 
 (World
    (let ((o1 (Object (RiSphere 1 -1 1 360))))
      (RiLightSource "ambientlight" '("intensity" 0.2))
      (RiLightSource "distantlight" '("intensity" 1.2
                                      "from" #f32(0 0 -6)
                                      "to" #f32(0 0 0)))
      (RiColor #f32(1.0 0.0 0.0))
      (RiSurface "plastic")
      (RiTranslate -2.0 0 0)
      (RiSphere 1 -1 1 360)
      (RiColor #f32(0.0 1.0 0.0))
      (RiSurface "plastic" )
      (RiTranslate 4.0 0 0)
      (RiSphere 1 -1 1 360)
      (RiProcedural data bound subdiv free)
)))
(display count)
(myfilter)


