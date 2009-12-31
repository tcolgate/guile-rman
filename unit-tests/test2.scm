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
  (format #t "Percent: ~a Frame: ~a~%" percent frame))

(define (subdiv ptr LoD)
  (format #t "Ptr: ~a LoD ~a~%" ptr LoD))

(define (free ptr)
  (format #t "Ptr: ~a~%" ptr))

(define mybound (Bound 0.0 0.0 0.0 10.0 10.0 10.0))

(define data '("some" "data"))

(define count 1)
(define myfilter
  (lambda(a b c d)
    (let ((val (RiBoxFilter a b c d)))
      (set! count (+ count 1))
      (format #t "calling filter ~a ~a ~a ~a equaled ~a~%" a b c d val)
      val)))

(define myfilter2
  (lambda(a b c d)
    (format #t "pixel filter called")
    1))

(RIB "test"
  (RiDisplay "sphere1.tif" "framebuffer" "rgb")
  (RiFormat 320 240 1)
  (RiProjection "perspective" '("fov" 45.0))
  (RiTranslate 0 0 6)
  (RiProgressHandler progress)
  (RiPixelFilter myfilter 2 2)
;  (RiPixelFilter RiGaussianFilter 2 2)
 
 (World
    (let ((o1 (Object (RiSphere 1 -1 1 360))))
      (RiLightSource "ambientlight" (list "intensity" 0.2))
      (RiLightSource "distantlight" (list "intensity" 1.2
                                          "from" (Point 0 0 -6)
                                          "to" (Point 0 0 0)))
      (RiColor (Color 1.0 0.0 0.0))
      (RiSurface "plastic")
      (RiTranslate -2.0 0 0)
      (RiSphere 1 -1 1 360)
      (RiColor (Color 0.0 1.0 0.0))
      (RiSurface "plastic" )
      (RiTranslate 4.0 0 0)
      (RiSphere 1 -1 1 360)
      (RiProcedural data mybound subdiv free))))

(format #t "count: ~a~%"  count)


