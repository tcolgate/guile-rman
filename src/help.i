
%{
#include <ffi.h>
#include "libguile.h"
%}

%{

/*typedef RtVoid  ( *RtFunc ) ();*/
void
TrampolineRtFunc (ffi_cif *CIF, void *RET, void **args, void *SCM_HANDLER)
{
  if (!scm_is_eq (scm_thunk_p (SCM_HANDLER), SCM_BOOL_T)){
    printf ("Wont call non procedure %p\n",SCM_HANDLER);
    return;
  }
  scm_call0 ((SCM)SCM_HANDLER);
  return ;
};

RtFunc MakeSCMCallbackRtFunc(SCM p)
{
  ffi_cif *cif = (ffi_cif*) malloc (sizeof(ffi_cif));
  RtFunc callback;             /* ptr to generated code */
  void *cb_closure = ffi_closure_alloc (sizeof(ffi_closure), (void*) &callback);

  /* Initialize the cif */
  if (ffi_prep_cif(cif, FFI_DEFAULT_ABI, 0, &ffi_type_void, NULL) 
          != FFI_OK) {
       printf("Failed to intialize cif for callback\n");
  }

  ffi_prep_closure_loc (cb_closure, cif, TrampolineRtFunc, (void *)p, (void*) callback);
  return callback;
};
%}

%typemap(in)(RtFunc ) {
  $1 = MakeSCMCallbackRtFunc($input);
}


%{
/* typedef RtVoid  ( *RtProgressFunc ) ( RtFloat PercentComplete, RtInt FrameNo );*/
void
TrampolineRtProgressFunc (ffi_cif *CIF, void *RET, void **args, void *SCM_HANDLER)
{
  void* parg1 = args[0];
  void* parg2 = args[1];
  float arg1;
  int arg2;
  arg1 = *(float*)parg1;
  arg2 = *(int*)parg2;

  if (!scm_is_eq (scm_procedure_p (SCM_HANDLER), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtFloat,RtInt) procedure %p\n",SCM_HANDLER);
    return;
  }

  scm_call_2((SCM)SCM_HANDLER,scm_double2num((double)arg1),scm_int2num((int) arg2));
  return;
};

RtProgressFunc MakeSCMCallbackRtProgressFunc(SCM p)
{
  ffi_cif *cif = (ffi_cif*) malloc (sizeof(ffi_cif));
  ffi_type **args = (ffi_type**) malloc (sizeof(ffi_type*) * 2);
  RtProgressFunc callback;             /* ptr to generated code */
  void *cb_closure = ffi_closure_alloc (sizeof(ffi_closure), (void*) &callback);

  /* Describe the arguments */
  args[0] = &ffi_type_float;
  args[1] = &ffi_type_sint;

  /* Initialize the cif */
  if (ffi_prep_cif(cif, FFI_DEFAULT_ABI, 2, &ffi_type_void, args) 
          != FFI_OK) {
       printf("Failed to intialize cif for callback\n");
  }

  ffi_prep_closure_loc (cb_closure, cif, TrampolineRtProgressFunc, (void *)p, (void*) callback);
  return callback;
};
%}

%typemap(in)(RtProgressFunc) {
  $1 = MakeSCMCallbackRtProgressFunc($input);
}

%goops %{
; We will use an assoc to track data for scheme procedurals
(define procedural-assoc (list))
(export procedural-assoc)
%}
%{
/* typedef RtVoid  ( *RtProcSubdivFunc ) ( RtPointer, RtFloat ); */
void
TrampolineRtProcSubdivFunc (ffi_cif *CIF, void *RET, void **args, void *SCM_HANDLER)
{
  void* parg1 = args[0];
  void* parg2 = args[1];
  void* arg1 = (void*) *(void**)parg1;
  float arg2 = *(float*)parg2;
  SCM datalist;
  int datacount;
  SCM dataptrscm = SWIG_NewPointerObj (arg1, SWIGTYPE_p_void, 0);
  SCM dictionaryvar = scm_c_lookup("procedural-assoc");
  SCM dictionary = scm_variable_ref(dictionaryvar);
  SCM dataentry = scm_assoc(dataptrscm, dictionary);

  if (!scm_is_eq (scm_procedure_p (SCM_HANDLER), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtPointer,,RtFloat) procedure %p\n",SCM_HANDLER);
    return;
  };
  
  scm_call_2((SCM) SCM_HANDLER,scm_cdr(dataentry), scm_double2num((double)arg2));
  return;
};

RtProcSubdivFunc MakeSCMCallbackRtProcSubdivFunc(SCM p)
{
  ffi_cif *cif = (ffi_cif*) malloc (sizeof(ffi_cif));
  ffi_type **args = (ffi_type**) malloc (sizeof(ffi_type*) * 2);
  RtProcSubdivFunc callback;             /* ptr to generated code */
  void *cb_closure = ffi_closure_alloc (sizeof(ffi_closure), (void*) &callback);

  /* Describe the arguments */
  args[0] = &ffi_type_pointer;
  args[1] = &ffi_type_float;

  /* Initialize the cif */
  if (ffi_prep_cif(cif, FFI_DEFAULT_ABI, 2, &ffi_type_void, args) 
          != FFI_OK) {
       printf("Failed to intialize cif for callback\n");
  }

  ffi_prep_closure_loc (cb_closure, cif, TrampolineRtProcSubdivFunc, (void *)p, (void*) callback);
  return callback;
};
%}

%typemap(in)(RtProcSubdivFunc) {
  if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiProcDelayedReadArchive")))))){
    $1 = RiProcDelayedReadArchive;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiProcRunProgram")))))){
    $1 = RiProcRunProgram;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiProcDynamicLoad")))))){
    $1 = RiProcDynamicLoad;
  } else {
    $1 = MakeSCMCallbackRtProcSubdivFunc($input);
  };
}

%{
/* typedef RtVoid  ( *RtProcFreeFunc ) ( RtPointer ); */
void 
TrampolineRtProcFreeFunc (ffi_cif *CIF, void *RET, void **args, void *SCM_HANDLER)
{
  void* parg1 = args[0];
  char** arg1 = (char**) *(void**)parg1;
  SCM datalist;
  int datacount;
  SCM dataptrscm = SWIG_NewPointerObj (arg1, SWIGTYPE_p_void, 0);
  SCM dictionaryvar = scm_c_lookup("procedural-assoc");
  SCM dictionary = scm_variable_ref(dictionaryvar);
  SCM dataentry = scm_assoc(dataptrscm, dictionary);

  if (!scm_is_eq (scm_procedure_p (SCM_HANDLER), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtPointer,,RtFloat) procedure %p\n",SCM_HANDLER);
    return;
  };

  scm_call_1(SCM_HANDLER,scm_cdr(dataentry));
  return;
};

RtProcFreeFunc MakeSCMCallbackRtProcFreeFunc(SCM p)
{
  ffi_cif *cif = (ffi_cif*) malloc (sizeof(ffi_cif));
  ffi_type **args = (ffi_type**) malloc (sizeof(ffi_type*) * 1);
  RtProcFreeFunc callback;             /* ptr to generated code */
  void *cb_closure = ffi_closure_alloc (sizeof(ffi_closure), (void*) &callback);

  /* Describe the arguments */
  args[0] = &ffi_type_pointer;

  /* Initialize the cif */
  if (ffi_prep_cif(cif, FFI_DEFAULT_ABI, 1, &ffi_type_void, args) 
          != FFI_OK) {
       printf("Failed to intialize cif for callback\n");
  }

  ffi_prep_closure_loc (cb_closure, cif, TrampolineRtProcFreeFunc, (void *)p, (void*) callback);
  return callback;
};
%}

%typemap(in)(RtProcFreeFunc) {
  if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiProcFree")))))){
    $1 = RiProcFree;
  } else {
    $1 = MakeSCMCallbackRtProcFreeFunc($input);
  };
}

%typemap(in)(RtPointer data) {
  int l = scm_to_int(scm_length($input));
  int i;
  char ** data = (char**) malloc (sizeof (char*) * (l+1));
  for (i=0; i<l;i++){
    SCM arg = scm_list_ref($input,scm_from_int(i));
    if(scm_is_string(arg)){
      data[i] = (char*) scm_to_locale_string(arg);
    } else {
      data[i] = "Could not conert, use strings only";
    };
  };
  data[i] = (char*) NULL;
  $1 = (void*) data;
  /* store an association that we can look up from scheme procedurals */
  SCM dataptrscm = SWIG_NewPointerObj (data, SWIGTYPE_p_void, 0);
  SCM dictionaryvar = scm_c_lookup("procedural-assoc");
  SCM dictionary = scm_variable_ref(dictionaryvar);
  scm_c_define("procedural-assoc", scm_acons( dataptrscm, $input ,dictionary));
}

%{
/* typedef RtFloat ( *RtFilterFunc ) ( RtFloat, RtFloat, RtFloat, RtFloat ); */
void 
TrampolineRtFilterFunc (ffi_cif *CIF, void *RET, void **args, void *SCM_HANDLER)
{
  void* parg1 = args[0];
  void* parg2 = args[1];
  void* parg3 = args[2];
  void* parg4 = args[3];
  float arg1 = *(float*)parg1;
  float arg2 = *(float*)parg2;
  float arg3 = *(float*)parg3;
  float arg4 = *(float*)parg4;
  
  float result;

  if (!scm_is_eq (scm_procedure_p (SCM_HANDLER), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtPointer) procedure %p\n",SCM_HANDLER);
    return;
  }

/*  scm_call_1(P,SWIG_NewPointerObj (arg1, SWIGTYPE_p_void, 0)); */
  result = (float) scm_to_double (scm_call_4((SCM) SCM_HANDLER, scm_double2num((double)arg1), scm_double2num((double)arg2), scm_double2num((double)arg3), scm_double2num((double)arg4)));
  *((float*) RET) = result;

  return;
};

RtFilterFunc MakeSCMCallbackRtFilterFunc(SCM p)
{
  ffi_cif *cif = (ffi_cif*) malloc (sizeof(ffi_cif));
  ffi_type **args = (ffi_type**) malloc (sizeof(ffi_type*) * 4);
  RtFilterFunc callback;             /* ptr to generated code */
  void *cb_closure = ffi_closure_alloc (sizeof(ffi_closure), (void*) &callback);

  /* Describe the arguments */
  args[0] = &ffi_type_float;
  args[1] = &ffi_type_float;
  args[2] = &ffi_type_float;
  args[3] = &ffi_type_float;

  /* Initialize the cif */
  if (ffi_prep_cif(cif, FFI_DEFAULT_ABI, 4, &ffi_type_float, args) 
          != FFI_OK) {
       printf("Failed to intialize cif for callback\n");
  };

  ffi_prep_closure_loc (cb_closure, cif, TrampolineRtFilterFunc, (void *)p, (void*) callback);
  return callback;
};

%}
%typemap(in)(RtFilterFunc) {
  if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiGaussianFilter")))))){
    $1 = RiGaussianFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiBoxFilter")))))){
    $1 = RiBoxFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiMitchellFilter")))))){
    $1 = RiMitchellFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiTriangleFilter")))))){
    $1 = RiTriangleFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiCatmullRomFilter")))))){
    $1 = RiCatmullRomFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiSincFilter")))))){
    $1 = RiSincFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiDiskFilter")))))){
    $1 = RiDiskFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiBesselFilter")))))){
    $1 = RiBesselFilter;
  } else {
    $1 = MakeSCMCallbackRtFilterFunc($input);
  };
}

