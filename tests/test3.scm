#!/usr/bin/guile -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; testrrrrm - An exaple excersizing some of the RiSpec callback
;; functions
;;
;;-------------------------------------------------------------------

(use-modules (rman ri2rib))
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

(define (filtertest x y w h)
  (display "filter ")
  (display x)
  (display y)
  (display w)
  (display h)
  (newline)
  (RiDiskFilter x y w h))

(define bound #f32(0.0 0.0 0.0 10.0 10.0 10.0))

(define data '("some data"))

(RIB "test3.rib"
  (RiDisplay "sphere1.tif" "file" "rgb")
  (RiFormat 320 240 1)
  (RiProjection "perspective" '("fov" 45.0))
  (RiTranslate 0 0 6)
  ;(RiProgressHandler progress)
  (RiPixelFilter RiBoxFilter 1 1)
  (World
    (let ((o1 (Object (RiSphere 1 -1 1 360))))
      (RiLightSource "ambientlight" '("intensity" 0.2))
      (RiLightSource "distantlight" '("intensity" 1.2
                                      "from" #f32(0 0 -6)
                                      "to" #f32(0 0 0)))
      (RiColor #f32(1.0 0.0 0.0))
      (RiSurface "plastic")
      (RiTranslate -2.0 0 0)
      (RiObjectInstance o1)
      (RiColor #f32(0.0 1.0 0.0))
      (RiSurface "plastic")
      (RiTranslate 4.0 0 0)
      (RiObjectInstance o1)
      (RiProcedural data bound subdiv free)
      (RiProcedural '("some data" "tester")  bound  RiProcDelayedReadArchive RiProcFree)
      (RiProcedural '("some data" "things" "more things")  bound  RiProcRunProgram RiProcFree)
)))


