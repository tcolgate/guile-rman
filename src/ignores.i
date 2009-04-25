/*-------------------------------------------------------------------
 * Copyright (C) 2009 Tristan Colgate 
 *
 * ignores.i - This file defines functions to ignore and 
 * also renames the non-variadic functions to the more recognisable
 * names.
 *
 *-------------------------------------------------------------------
 */

%ignore RiProjection;
%rename (RiProjection) RiProjectionV;
%ignore RiImager;
%rename (RiImager) RiImagerV;
%ignore RiDisplay;
%rename (RiDisplay) RiDisplayV;
%ignore RiHider;
%rename (RiHider) RiHiderV;
%ignore RiOption;
%rename (RiOption) RiOptionV;
%ignore RiLightSource;
%rename (RiLightSource) RiLightSourceV;
%ignore RiAreaLightSource;
%rename (RiAreaLightSource) RiAreaLightSourceV;
%ignore RiSurface;
%rename (RiSurface) RiSurfaceV;
%ignore RiDeformation;
%rename (RiDeformation) RiDeformationV;
%ignore RiDisplacement;
%rename (RiDisplacement) RiDisplacementV;
%ignore RiAtmosphere;
%rename (RiAtmosphere) RiAtmosphereV;
%ignore RiInterior;
%rename (RiInterior) RiInteriorV;
%ignore RiExterior;
%rename (RiExterior) RiExteriorV;
%ignore RiShaderLayer;
%rename (RiShaderLayer) RiShaderLayerV;
%ignore RiResource;
%rename (RiResource) RiResourceV;
%ignore RiAttribute;
%rename (RiAttribute) RiAttributeV;
%ignore RiPolygon;
%rename (RiPolygon) RiPolygonV;
%ignore RiGeneralPolygon;
%rename (RiGeneralPolygon) RiGeneralPolygonV;
%ignore RiPointsPolygons;
%rename (RiPointsPolygons) RiPointsPolygonsV;
%ignore RiPointsGeneralPolygons;
%rename (RiPointsGeneralPolygons) RiPointsGeneralPolygonsV;
%ignore RiPatch;
%rename (RiPatch) RiPatchV;
%ignore RiPatchMesh;
%rename (RiPatchMesh) RiPatchMeshV;
%ignore RiNuPatch;
%rename (RiNuPatch) RiNuPatchV;
%ignore RiSubdivisionMesh;
%rename (RiSubdivisionMesh) RiSubdivisionMeshV;
%ignore RiSphere;
%rename (RiSphere) RiSphereV;
%ignore RiCone;
%rename (RiCone) RiConeV;
%ignore RiCylinder;
%rename (RiCylinder) RiCylinderV;
%ignore RiHyperboloid;
%rename (RiHyperboloid) RiHyperboloidV;
%ignore RiParaboloid;
%rename (RiParaboloid) RiParaboloidV;
%ignore RiDisk;
%rename (RiDisk) RiDiskV;
%ignore RiTorus;
%rename (RiTorus) RiTorusV;
%ignore RiPoints;
%rename (RiPoints) RiPointsV;
%ignore RiCurves;
%rename (RiCurves) RiCurvesV;
%ignore RiBlobby;
%rename (RiBlobby) RiBlobbyV;
%ignore RiGeometry;
%rename (RiGeometry) RiGeometryV;
%ignore RiMotionBegin;
%rename (RiMotionBegin) RiMotionBeginV;
%ignore RiMakeTexture;
%rename (RiMakeTexture) RiMakeTextureV;
%ignore RiMakeBump;
%rename (RiMakeBump) RiMakeBumpV;
%ignore RiMakeLatLongEnvironment;
%rename (RiMakeLatLongEnvironment) RiMakeLatLongEnvironmentV;
%ignore RiMakeCubeFaceEnvironment;
%rename (RiMakeCubeFaceEnvironment) RiMakeCubeFaceEnvironmentV;
%ignore RiMakeShadow;
%rename (RiMakeShadow) RiMakeShadowV;
%ignore RiMakeOcclusion;
%rename (RiMakeOcclusion) RiMakeOcclusionV;
%ignore RiArchiveRecord;
%rename (RiArchiveRecord) RiArchiveRecordV;
%ignore RiReadArchive;
%rename (RiReadArchive) RiReadArchiveV;
