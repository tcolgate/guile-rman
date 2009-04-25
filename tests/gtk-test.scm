#!/usr/bin/guile-gnome-0 -s
!#

;;-------------------------------------------------------------------
;; Copyright (C) 2009 Tristan Colgate 
;;
;; gtk-test.scm - A simple example of using the RiProgressHandler
;; callback to animate a Gtk+ progress bar.
;;
;;-------------------------------------------------------------------

(use-modules (rman rispec))
(use-modules (rman utilities))

(use-modules (oop goops) (gnome gobject) (gnome gtk))

(define (progress percent frame) #t) 

(define render-scene (lambda()(
(RIB "test)"
  (RiDisplay "sphere1.tif" "file" "rgb")
  (RiFormat 320 240 1)
  (RiProjection "perspective" '("fov" 45.0))
  (RiTranslate 0 0 6)
  (RiProgressHandler progress)
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
      ))))))

(define (render-with-progress)
  (let* ((window  (make <gtk-window> #:type 'toplevel))
	 (progbar (make <gtk-progress-bar> ))
         (progcall
                  (lambda (perc frame)
                    (gtk-progress-bar-set-fraction progbar (/ perc 100))
                    (show progbar)
                    (gtk-main-iteration-do))))
    (set window 'border-width 20)
    (add window progbar)
    (set! progress progcall) 
    (show-all window)
    (render-scene)
    (gtk-main)))
(render-with-progress)
