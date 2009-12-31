(define-module (rman utilities)
  #:use-module (rman rispec))

(define-syntax RIB
  (syntax-rules ()
   ((_ name code ... ) (begin (RiBegin name) code ... (RiEnd)))))

(define-syntax Frame
  (syntax-rules ()
   ((_ frameno code ... ) (begin  (RiFrameBegin frameno)  code ...  (RiFrameEnd)))))

(define-syntax World
  (syntax-rules ()
   ((_ code ... )  (begin (RiWorldBegin)  code ...  (RiWorldEnd)))))

(define-syntax Attribute
  (syntax-rules ()
   ((_ code ... )  (begin (RiAttributeBegin)  code ...  (RiAttributeEnd)))))

(define-syntax Transform
  (syntax-rules ()
   ((_ code ... )  (begin (RiTransformBegin) code ... (RiTransformEnd)))))

(define-syntax If
  (syntax-rules ()
   ((_ condition code ... )  (begin (RiIfBegin condition ) code ... (RiIfEnd)))))

(define-syntax Motion
  (syntax-rules ()
   ((_ times code ... )  (begin (RiMotionBegin times ) code ... (RiMotionEnd)))))

(define-syntax Object
  (syntax-rules ()
   ((_ code ... ) (let ((handle (RiObjectBegin))) code ... (RiObjectEnd) handle))))

(define-syntax Solid
  (syntax-rules ()
   ((_ type code ... )  (begin (RiSolidBegin type ) code ... (RiSolidEnd)))))

(define-syntax Resource
  (syntax-rules ()
   ((_ code ... )  (begin (RiResourceBegin) code ... (RiResourceEnd)))))

(define-syntax Color
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Point
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax HPoint
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Vector
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Normal
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Bound
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Matrix
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(define-syntax Basis
  (syntax-rules ()
   ((_ vals ... ) (list->f32vector (list vals ... )))))

(export-syntax RIB World Frame Attribute If Transform Resource Solid Object)
(export-syntax Color Point HPoint Vector Normal Bound Matrix Basis)
