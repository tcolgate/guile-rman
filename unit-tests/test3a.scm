#!/usr/bin/guile -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; testrrrrm - An exaple excersizing some of the RiSpec callback
;; functions
;;
;;-------------------------------------------------------------------

;(use-modules (rman rispec))
(use-modules (rman ri2rib))
(use-modules (rman utilities))

(define (progress percent frame)
  (format "Percent: ~a  Frame: ~A~%" percent frame))

(define (subdiv ptr LoD)
  (format "Ptr: ~a LoD: ~a~%" ptr LoD))

(define (free ptr)
  (format "Ptr: ~a~%" ptr))

(define (filtertest x y w h)
  (format "filter ~a ~a ~a ~a~%" x y w h)
  (RiDiskFilter x y w h))

(define bound (Bound 0.0 0.0 0.0 10.0 10.0 10.0))

(define data '("some data"))


(RiBegin "test3.rib")
  (RiDisplay "sphere1.tif" "file" "rgb")
  (RiFormat 320 240 1)
  (RiProjection "perspective" '("uniform float fov" 45.0))
  (RiTranslate 0 0 6)
;  (RiProgressHandler progress)
  (RiPixelFilter RiBoxFilter 1 1)
  (RiWorldBegin)
    (let ((o1 (Object (RiSphere 1 -1 1 360))))
      (RiLightSource "ambientlight" (list "uniform float intensity" 0.2))
      (RiLightSource "distantlight" (list "uniform float intensity2" 1.2 
                                          "uniform point from" (Point 0 0 -6)
                                          "uniform point to" (Point 0 0 0)
                                          "uniform float[3] test" (1 1.0 1.0)))
      (RiColor (Color 1.0 0.0 0.0))
      (RiSurface "plastic")
      (RiTranslate -2.0 0 0)
      (RiObjectInstance o1)
      (RiColor (Color 0.0 1.0 0.0))
      (RiSurface "plastic")
      (RiTranslate 4.0 0 0)
      (RiObjectInstance o1)
      (RiProcedural data bound subdiv free)
      (RiProcedural '("some data" "tester")  bound  RiProcDelayedReadArchive RiProcFree)
      (RiProcedural '("some data" "things" "more things")  bound  RiProcRunProgram RiProcFree))
(RiWorldEnd)
(RiEnd)


