(define-module (rman utilities)
  #:use-syntax (oop goops)
  #:use-syntax (ice-9 syncase)
  #:use-module (rman rispec))

(define-syntax RIB
  (syntax-rules ()
   ((RIB name code ... ) (begin (RiBegin name) code ... (RiEnd)))))

(define-syntax Frame
  (syntax-rules ()
   ((Frame frameno code ... ) (begin  (RiFrameBegin frameno)  code ...  (RiFrameEnd)))))

(define-syntax World
  (syntax-rules ()
   ((World code ... )  (begin (RiWorldBegin)  code ...  (RiWorldEnd)))))

(define-syntax Attribute
  (syntax-rules ()
   ((Attribute code ... )  (begin (RiAttributeBegin)  code ...  (RiAttributeEnd)))))

(define-syntax Transform
  (syntax-rules ()
   ((Transform code ... )  (begin (RiTransformBegin) code ... (RiTransformEnd)))))

(define-syntax If
  (syntax-rules ()
   ((If condition code ... )  (begin (RiIfBegin condition ) code ... (RiIfEnd)))))

(define-syntax Motion
  (syntax-rules ()
   ((Motion times code ... )  (begin (RiMotionBegin times ) code ... (RiMotionEnd)))))

(define-syntax Object
  (syntax-rules ()
   ((Object code ... ) (let ((handle (RiObjectBegin))) code ... (RiObjectEnd) handle))))

(define-syntax Solid
  (syntax-rules ()
   ((Solid type code ... )  (begin (RiSolidBegin type ) code ... (RiSolidEnd)))))

(define-syntax Resource
  (syntax-rules ()
   ((Resource code ... )  (begin (RiResourceBegin) code ... (RiResourceEnd)))))

(export-syntax RIB World Frame Attribute If Transform Resource Solid Object)
