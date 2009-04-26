;;; -*- buffer-read-only: t -*- vi: set ro: */
;;; Automatically generated by SWIG; do not edit.

(define-module (rman rispec))

 (load-extension "libguile_rman_rispec.so" "scm_init_rman_rispec_module")


(use-modules (oop goops) (Swig common))
(use-modules ((rman rispec-primitive) :renamer (symbol-prefix-proc 'primitive:)))
(define TrampolineRtFunc primitive:TrampolineRtFunc)
(define MakeSCMCallbackRtFunc primitive:MakeSCMCallbackRtFunc)
(define TrampolineRtProgressFunc primitive:TrampolineRtProgressFunc)
(define MakeSCMCallbackRtProgressFunc primitive:MakeSCMCallbackRtProgressFunc)
(define TrampolineRtProcSubdivFunc primitive:TrampolineRtProcSubdivFunc)
(define MakeSCMCallbackRtProcSubdivFunc primitive:MakeSCMCallbackRtProcSubdivFunc)
(define TrampolineRtProcFreeFunc primitive:TrampolineRtProcFreeFunc)
(define MakeSCMCallbackRtProcFreeFunc primitive:MakeSCMCallbackRtProcFreeFunc)
(define TrampolineRtFilterFunc primitive:TrampolineRtFilterFunc)
(define MakeSCMCallbackRtFilterFunc primitive:MakeSCMCallbackRtFilterFunc)
(define AQSIS-COMPILER-H-INCLUDED primitive:AQSIS-COMPILER-H-INCLUDED)
(define AQSIS-SYSTEM-POSIX primitive:AQSIS-SYSTEM-POSIX)
(define AQSIS-COMPILER-GCC primitive:AQSIS-COMPILER-GCC)
(define SHARED-LIBRARY-SUFFIX primitive:SHARED-LIBRARY-SUFFIX)
(define RI-FALSE primitive:RI-FALSE)
(define RI-TRUE primitive:RI-TRUE)
(define RI-PI primitive:RI-PI)
(define RI-PIO2 primitive:RI-PIO2)
(define RI-SHADER-EXTENSION primitive:RI-SHADER-EXTENSION)
(define RI-FRAMEBUFFER primitive:RI-FRAMEBUFFER)
(define RI-FILE primitive:RI-FILE)
(define RI-RGB primitive:RI-RGB)
(define RI-RGBA primitive:RI-RGBA)
(define RI-RGBZ primitive:RI-RGBZ)
(define RI-RGBAZ primitive:RI-RGBAZ)
(define RI-A primitive:RI-A)
(define RI-Z primitive:RI-Z)
(define RI-AZ primitive:RI-AZ)
(define RI-MERGE primitive:RI-MERGE)
(define RI-ORIGIN primitive:RI-ORIGIN)
(define RI-PERSPECTIVE primitive:RI-PERSPECTIVE)
(define RI-ORTHOGRAPHIC primitive:RI-ORTHOGRAPHIC)
(define RI-HIDDEN primitive:RI-HIDDEN)
(define RI-PAINT primitive:RI-PAINT)
(define RI-CONSTANT primitive:RI-CONSTANT)
(define RI-SMOOTH primitive:RI-SMOOTH)
(define RI-FLATNESS primitive:RI-FLATNESS)
(define RI-FOV primitive:RI-FOV)
(define RI-AMBIENTLIGHT primitive:RI-AMBIENTLIGHT)
(define RI-POINTLIGHT primitive:RI-POINTLIGHT)
(define RI-DISTANTLIGHT primitive:RI-DISTANTLIGHT)
(define RI-SPOTLIGHT primitive:RI-SPOTLIGHT)
(define RI-INTENSITY primitive:RI-INTENSITY)
(define RI-LIGHTCOLOR primitive:RI-LIGHTCOLOR)
(define RI-FROM primitive:RI-FROM)
(define RI-TO primitive:RI-TO)
(define RI-CONEANGLE primitive:RI-CONEANGLE)
(define RI-CONEDELTAANGLE primitive:RI-CONEDELTAANGLE)
(define RI-BEAMDISTRIBUTION primitive:RI-BEAMDISTRIBUTION)
(define RI-MATTE primitive:RI-MATTE)
(define RI-METAL primitive:RI-METAL)
(define RI-PLASTIC primitive:RI-PLASTIC)
(define RI-SHINYMETAL primitive:RI-SHINYMETAL)
(define RI-PAINTEDPLASTIC primitive:RI-PAINTEDPLASTIC)
(define RI-KA primitive:RI-KA)
(define RI-KD primitive:RI-KD)
(define RI-KS primitive:RI-KS)
(define RI-ROUGHNESS primitive:RI-ROUGHNESS)
(define RI-KR primitive:RI-KR)
(define RI-TEXTURENAME primitive:RI-TEXTURENAME)
(define RI-SPECULARCOLOR primitive:RI-SPECULARCOLOR)
(define RI-DEPTHCUE primitive:RI-DEPTHCUE)
(define RI-FOG primitive:RI-FOG)
(define RI-BUMPY primitive:RI-BUMPY)
(define RI-MINDISTANCE primitive:RI-MINDISTANCE)
(define RI-MAXDISTANCE primitive:RI-MAXDISTANCE)
(define RI-BACKGROUND primitive:RI-BACKGROUND)
(define RI-DISTANCE primitive:RI-DISTANCE)
(define RI-AMPLITUDE primitive:RI-AMPLITUDE)
(define RI-RASTER primitive:RI-RASTER)
(define RI-SCREEN primitive:RI-SCREEN)
(define RI-CAMERA primitive:RI-CAMERA)
(define RI-WORLD primitive:RI-WORLD)
(define RI-OBJECT primitive:RI-OBJECT)
(define RI-INSIDE primitive:RI-INSIDE)
(define RI-OUTSIDE primitive:RI-OUTSIDE)
(define RI-LH primitive:RI-LH)
(define RI-RH primitive:RI-RH)
(define RI-P primitive:RI-P)
(define RI-PZ primitive:RI-PZ)
(define RI-PW primitive:RI-PW)
(define RI-N primitive:RI-N)
(define RI-NP primitive:RI-NP)
(define RI-CS primitive:RI-CS)
(define RI-OS primitive:RI-OS)
(define RI-S primitive:RI-S)
(define RI-T primitive:RI-T)
(define RI-ST primitive:RI-ST)
(define RI-BILINEAR primitive:RI-BILINEAR)
(define RI-BICUBIC primitive:RI-BICUBIC)
(define RI-LINEAR primitive:RI-LINEAR)
(define RI-CUBIC primitive:RI-CUBIC)
(define RI-PRIMITIVE primitive:RI-PRIMITIVE)
(define RI-INTERSECTION primitive:RI-INTERSECTION)
(define RI-UNION primitive:RI-UNION)
(define RI-DIFFERENCE primitive:RI-DIFFERENCE)
(define RI-WRAP primitive:RI-WRAP)
(define RI-NOWRAP primitive:RI-NOWRAP)
(define RI-PERIODIC primitive:RI-PERIODIC)
(define RI-NONPERIODIC primitive:RI-NONPERIODIC)
(define RI-CLAMP primitive:RI-CLAMP)
(define RI-BLACK primitive:RI-BLACK)
(define RI-IGNORE primitive:RI-IGNORE)
(define RI-PRINT primitive:RI-PRINT)
(define RI-ABORT primitive:RI-ABORT)
(define RI-HANDLER primitive:RI-HANDLER)
(define RI-IDENTIFIER primitive:RI-IDENTIFIER)
(define RI-NAME primitive:RI-NAME)
(define RI-COMMENT primitive:RI-COMMENT)
(define RI-STRUCTURE primitive:RI-STRUCTURE)
(define RI-VERBATIM primitive:RI-VERBATIM)
(define RI-WIDTH primitive:RI-WIDTH)
(define RI-CONSTANTWIDTH primitive:RI-CONSTANTWIDTH)
(define RI-CURRENT primitive:RI-CURRENT)
(define RI-SHADER primitive:RI-SHADER)
(define RI-EYE primitive:RI-EYE)
(define RI-NDC primitive:RI-NDC)
(define RiBezierBasis primitive:RiBezierBasis)
(define RiBSplineBasis primitive:RiBSplineBasis)
(define RiCatmullRomBasis primitive:RiCatmullRomBasis)
(define RiHermiteBasis primitive:RiHermiteBasis)
(define RiPowerBasis primitive:RiPowerBasis)
(define RiLastError primitive:RiLastError)
(define BasisFromName primitive:BasisFromName)
(define RiProgressHandler primitive:RiProgressHandler)
(define RiPreRenderFunction primitive:RiPreRenderFunction)
(define RiPreWorldFunction primitive:RiPreWorldFunction)
(define RiDeclare primitive:RiDeclare)
(define RiBegin primitive:RiBegin)
(define RiEnd primitive:RiEnd)
(define RiGetContext primitive:RiGetContext)
(define RiContext primitive:RiContext)
(define RiFrameBegin primitive:RiFrameBegin)
(define RiFrameEnd primitive:RiFrameEnd)
(define RiWorldBegin primitive:RiWorldBegin)
(define RiWorldEnd primitive:RiWorldEnd)
(define RiIfBegin primitive:RiIfBegin)
(define RiElseIf primitive:RiElseIf)
(define RiElse primitive:RiElse)
(define RiIfEnd primitive:RiIfEnd)
(define RiFormat primitive:RiFormat)
(define RiFrameAspectRatio primitive:RiFrameAspectRatio)
(define RiScreenWindow primitive:RiScreenWindow)
(define RiCropWindow primitive:RiCropWindow)
(define RiProjection primitive:RiProjection)
(define RiClipping primitive:RiClipping)
(define RiClippingPlane primitive:RiClippingPlane)
(define RiDepthOfField primitive:RiDepthOfField)
(define RiShutter primitive:RiShutter)
(define RiPixelVariance primitive:RiPixelVariance)
(define RiPixelSamples primitive:RiPixelSamples)
(define RiPixelFilter primitive:RiPixelFilter)
(define RiExposure primitive:RiExposure)
(define RiImager primitive:RiImager)
(define RiQuantize primitive:RiQuantize)
(define RiDisplay primitive:RiDisplay)
(define RiGaussianFilter primitive:RiGaussianFilter)
(define RiBoxFilter primitive:RiBoxFilter)
(define RiMitchellFilter primitive:RiMitchellFilter)
(define RiTriangleFilter primitive:RiTriangleFilter)
(define RiCatmullRomFilter primitive:RiCatmullRomFilter)
(define RiSincFilter primitive:RiSincFilter)
(define RiDiskFilter primitive:RiDiskFilter)
(define RiBesselFilter primitive:RiBesselFilter)
(define RiHider primitive:RiHider)
(define RiColorSamples primitive:RiColorSamples)
(define RiRelativeDetail primitive:RiRelativeDetail)
(define RiOption primitive:RiOption)
(define RiAttributeBegin primitive:RiAttributeBegin)
(define RiAttributeEnd primitive:RiAttributeEnd)
(define RiColor primitive:RiColor)
(define RiOpacity primitive:RiOpacity)
(define RiTextureCoordinates primitive:RiTextureCoordinates)
(define RiLightSource primitive:RiLightSource)
(define RiAreaLightSource primitive:RiAreaLightSource)
(define RiIlluminate primitive:RiIlluminate)
(define RiSurface primitive:RiSurface)
(define RiDeformation primitive:RiDeformation)
(define RiDisplacement primitive:RiDisplacement)
(define RiAtmosphere primitive:RiAtmosphere)
(define RiInterior primitive:RiInterior)
(define RiExterior primitive:RiExterior)
(define RiShaderLayer primitive:RiShaderLayer)
(define RiConnectShaderLayers primitive:RiConnectShaderLayers)
(define RiShadingRate primitive:RiShadingRate)
(define RiShadingInterpolation primitive:RiShadingInterpolation)
(define RiMatte primitive:RiMatte)
(define RiBound primitive:RiBound)
(define RiDetail primitive:RiDetail)
(define RiDetailRange primitive:RiDetailRange)
(define RiGeometricApproximation primitive:RiGeometricApproximation)
(define RiOrientation primitive:RiOrientation)
(define RiReverseOrientation primitive:RiReverseOrientation)
(define RiSides primitive:RiSides)
(define RiIdentity primitive:RiIdentity)
(define RiTransform primitive:RiTransform)
(define RiConcatTransform primitive:RiConcatTransform)
(define RiPerspective primitive:RiPerspective)
(define RiTranslate primitive:RiTranslate)
(define RiRotate primitive:RiRotate)
(define RiScale primitive:RiScale)
(define RiSkew primitive:RiSkew)
(define RiCoordinateSystem primitive:RiCoordinateSystem)
(define RiCoordSysTransform primitive:RiCoordSysTransform)
(define RiTransformPoints primitive:RiTransformPoints)
(define RiTransformBegin primitive:RiTransformBegin)
(define RiTransformEnd primitive:RiTransformEnd)
(define RiResource primitive:RiResource)
(define RiResourceBegin primitive:RiResourceBegin)
(define RiResourceEnd primitive:RiResourceEnd)
(define RiAttribute primitive:RiAttribute)
(define RiPolygon primitive:RiPolygon)
(define RiGeneralPolygon primitive:RiGeneralPolygon)
(define RiPointsPolygons primitive:RiPointsPolygons)
(define RiPointsGeneralPolygons primitive:RiPointsGeneralPolygons)
(define RiBasis primitive:RiBasis)
(define RiPatch primitive:RiPatch)
(define RiPatchMesh primitive:RiPatchMesh)
(define RiNuPatch primitive:RiNuPatch)
(define RiTrimCurve primitive:RiTrimCurve)
(define RiSubdivisionMesh primitive:RiSubdivisionMesh)
(define RiSphere primitive:RiSphere)
(define RiCone primitive:RiCone)
(define RiCylinder primitive:RiCylinder)
(define RiHyperboloid primitive:RiHyperboloid)
(define RiParaboloid primitive:RiParaboloid)
(define RiDisk primitive:RiDisk)
(define RiTorus primitive:RiTorus)
(define RiPoints primitive:RiPoints)
(define RiCurves primitive:RiCurves)
(define RiBlobby primitive:RiBlobby)
(define RiProcedural primitive:RiProcedural)
(define RiProcFree primitive:RiProcFree)
(define RiProcDelayedReadArchive primitive:RiProcDelayedReadArchive)
(define RiProcRunProgram primitive:RiProcRunProgram)
(define RiProcDynamicLoad primitive:RiProcDynamicLoad)
(define RiGeometry primitive:RiGeometry)
(define RiSolidBegin primitive:RiSolidBegin)
(define RiSolidEnd primitive:RiSolidEnd)
(define RiObjectBegin primitive:RiObjectBegin)
(define RiObjectEnd primitive:RiObjectEnd)
(define RiObjectInstance primitive:RiObjectInstance)
(define RiMotionBegin primitive:RiMotionBegin)
(define RiMotionEnd primitive:RiMotionEnd)
(define RiMakeTexture primitive:RiMakeTexture)
(define RiMakeBump primitive:RiMakeBump)
(define RiMakeLatLongEnvironment primitive:RiMakeLatLongEnvironment)
(define RiMakeCubeFaceEnvironment primitive:RiMakeCubeFaceEnvironment)
(define RiMakeShadow primitive:RiMakeShadow)
(define RiMakeOcclusion primitive:RiMakeOcclusion)
(define RiErrorHandler primitive:RiErrorHandler)
(define RiErrorIgnore primitive:RiErrorIgnore)
(define RiErrorPrint primitive:RiErrorPrint)
(define RiErrorAbort primitive:RiErrorAbort)
(define RiReadArchive primitive:RiReadArchive)

(export TrampolineRtFunc MakeSCMCallbackRtFunc TrampolineRtProgressFunc MakeSCMCallbackRtProgressFunc TrampolineRtProcSubdivFunc MakeSCMCallbackRtProcSubdivFunc TrampolineRtProcFreeFunc MakeSCMCallbackRtProcFreeFunc TrampolineRtFilterFunc MakeSCMCallbackRtFilterFunc AQSIS-COMPILER-H-INCLUDED AQSIS-SYSTEM-POSIX AQSIS-COMPILER-GCC SHARED-LIBRARY-SUFFIX RI-FALSE RI-TRUE RI-PI RI-PIO2 RI-SHADER-EXTENSION RI-FRAMEBUFFER RI-FILE RI-RGB RI-RGBA RI-RGBZ RI-RGBAZ RI-A RI-Z RI-AZ RI-MERGE RI-ORIGIN RI-PERSPECTIVE RI-ORTHOGRAPHIC RI-HIDDEN RI-PAINT RI-CONSTANT RI-SMOOTH RI-FLATNESS RI-FOV RI-AMBIENTLIGHT RI-POINTLIGHT RI-DISTANTLIGHT RI-SPOTLIGHT RI-INTENSITY RI-LIGHTCOLOR RI-FROM RI-TO RI-CONEANGLE RI-CONEDELTAANGLE RI-BEAMDISTRIBUTION RI-MATTE RI-METAL RI-PLASTIC RI-SHINYMETAL RI-PAINTEDPLASTIC RI-KA RI-KD RI-KS RI-ROUGHNESS RI-KR RI-TEXTURENAME RI-SPECULARCOLOR RI-DEPTHCUE RI-FOG RI-BUMPY RI-MINDISTANCE RI-MAXDISTANCE RI-BACKGROUND RI-DISTANCE RI-AMPLITUDE RI-RASTER RI-SCREEN RI-CAMERA RI-WORLD RI-OBJECT RI-INSIDE RI-OUTSIDE RI-LH RI-RH RI-P RI-PZ RI-PW RI-N RI-NP RI-CS RI-OS RI-S RI-T RI-ST RI-BILINEAR RI-BICUBIC RI-LINEAR RI-CUBIC RI-PRIMITIVE RI-INTERSECTION RI-UNION RI-DIFFERENCE RI-WRAP RI-NOWRAP RI-PERIODIC RI-NONPERIODIC RI-CLAMP RI-BLACK RI-IGNORE RI-PRINT RI-ABORT RI-HANDLER RI-IDENTIFIER RI-NAME RI-COMMENT RI-STRUCTURE RI-VERBATIM RI-WIDTH RI-CONSTANTWIDTH RI-CURRENT RI-SHADER RI-EYE RI-NDC RiBezierBasis RiBSplineBasis RiCatmullRomBasis RiHermiteBasis RiPowerBasis RiLastError BasisFromName RiProgressHandler RiPreRenderFunction RiPreWorldFunction RiDeclare RiBegin RiEnd RiGetContext RiContext RiFrameBegin RiFrameEnd RiWorldBegin RiWorldEnd RiIfBegin RiElseIf RiElse RiIfEnd RiFormat RiFrameAspectRatio RiScreenWindow RiCropWindow RiProjection RiClipping RiClippingPlane RiDepthOfField RiShutter RiPixelVariance RiPixelSamples RiPixelFilter RiExposure RiImager RiQuantize RiDisplay RiGaussianFilter RiBoxFilter RiMitchellFilter RiTriangleFilter RiCatmullRomFilter RiSincFilter RiDiskFilter RiBesselFilter RiHider RiColorSamples RiRelativeDetail RiOption RiAttributeBegin RiAttributeEnd RiColor RiOpacity RiTextureCoordinates RiLightSource RiAreaLightSource RiIlluminate RiSurface RiDeformation RiDisplacement RiAtmosphere RiInterior RiExterior RiShaderLayer RiConnectShaderLayers RiShadingRate RiShadingInterpolation RiMatte RiBound RiDetail RiDetailRange RiGeometricApproximation RiOrientation RiReverseOrientation RiSides RiIdentity RiTransform RiConcatTransform RiPerspective RiTranslate RiRotate RiScale RiSkew RiCoordinateSystem RiCoordSysTransform RiTransformPoints RiTransformBegin RiTransformEnd RiResource RiResourceBegin RiResourceEnd RiAttribute RiPolygon RiGeneralPolygon RiPointsPolygons RiPointsGeneralPolygons RiBasis RiPatch RiPatchMesh RiNuPatch RiTrimCurve RiSubdivisionMesh RiSphere RiCone RiCylinder RiHyperboloid RiParaboloid RiDisk RiTorus RiPoints RiCurves RiBlobby RiProcedural RiProcFree RiProcDelayedReadArchive RiProcRunProgram RiProcDynamicLoad RiGeometry RiSolidBegin RiSolidEnd RiObjectBegin RiObjectEnd RiObjectInstance RiMotionBegin RiMotionEnd RiMakeTexture RiMakeBump RiMakeLatLongEnvironment RiMakeCubeFaceEnvironment RiMakeShadow RiMakeOcclusion RiErrorHandler RiErrorIgnore RiErrorPrint RiErrorAbort RiReadArchive )