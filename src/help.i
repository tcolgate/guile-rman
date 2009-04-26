/*-------------------------------------------------------------------
 * Copyright (C) 2009 Tristan Colgate 
 *
 * help.i - Support functions definning callack generation
 * functions and related typemaps.
 *
 *-------------------------------------------------------------------
 */

%inline %{
#include "lightning.h"
#include "libguile.h"

/*typedef RtVoid  ( *RtFunc ) ();*/
RtVoid TrampolineRtFunc (SCM P)
{

  if (!scm_is_eq (scm_thunk_p (P), SCM_BOOL_T)){
    printf ("Wont call non procedure %p\n",P);
    return;
  }

  scm_call_0(P);
  return;
};

RtFunc MakeSCMCallbackRtFunc(SCM p)
{
  RtFunc    callback;             /* ptr to generated code */
  char          *start, *end;           /* a couple of labels */

  jit_insn *codegen = (jit_insn*) malloc (1024);
  callback = (RtFunc) (jit_set_ip(codegen).vptr);
  start = jit_get_ip().ptr;
  jit_prolog(0);
  jit_movi_p(JIT_R0, p);
  jit_prepare(1);
    jit_pusharg_p(JIT_R0);
  jit_finish(TrampolineRtFunc);
  jit_ret();
  end = jit_get_ip().ptr;

  jit_flush_code(start, end);

  return callback;
};
%}

%typemap(in)(RtFunc ) {
  $1 = MakeSCMCallbackRtFunc($input);
}

%inline %{
/* typedef RtVoid  ( *RtProgressFunc ) ( RtFloat PercentComplete, RtInt FrameNo );*/
RtVoid TrampolineRtProgressFunc (SCM P, RtFloat arg1, RtInt arg2)
{

  if (!scm_is_eq (scm_procedure_p (P), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtFloat,RtInt) procedure %p\n",P);
    return;
  }

  scm_call_2(P,scm_double2num((double)arg1),scm_int2num((int) arg2));
  return;
};

RtProgressFunc MakeSCMCallbackRtProgressFunc(SCM p)
{
  RtProgressFunc callback;             /* ptr to generated code */
  char          *start, *end;           /* a couple of labels */
  float arg1;
  int arg2;

  jit_insn *codegen = (jit_insn*) malloc (1024);
  callback = (RtProgressFunc) (jit_set_ip(codegen).vptr);
  start = jit_get_ip().ptr;
  jit_prolog(2);
  arg1 = jit_arg_f();
  arg2 = jit_arg_i();
  jit_movi_p(JIT_R0, p);
  jit_getarg_f(JIT_FPR1, arg1);
  jit_getarg_i(JIT_R2, arg2);
  jit_prepare(3);
    jit_pusharg_i(JIT_R2);
    jit_pusharg_f(JIT_FPR1);
    jit_pusharg_p(JIT_R0);
  jit_finish(TrampolineRtProgressFunc);
  jit_ret();
  end = jit_get_ip().ptr;

  jit_flush_code(start, end);

  return callback;
};
%}

%typemap(in)(RtProgressFunc) {
  $1 = MakeSCMCallbackRtProgressFunc($input);
}

%inline %{
/* typedef RtVoid  ( *RtProcSubdivFunc ) ( RtPointer, RtFloat ); */
RtVoid TrampolineRtProcSubdivFunc (SCM P, RtPointer arg1, RtFloat arg2)
{

  if (!scm_is_eq (scm_procedure_p (P), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtPointer,,RtFloat) procedure %p\n",P);
    return;
  }

/*  scm_call_2(P,SWIG_NewPointerObj (arg1, SWIGTYPE_p_void, 0),scm_double2num((int) arg2)); */
  scm_call_2(P,(SCM) arg1,scm_double2num((int) arg2));
  return;
};

RtProcSubdivFunc MakeSCMCallbackRtProcSubdivFunc(SCM p)
{
  RtProcSubdivFunc callback;             /* ptr to generated code */
  char          *start, *end;           /* a couple of labels */
  int arg1;
  int arg2;

  jit_insn *codegen = (jit_insn*) malloc (1024);
  callback = (RtProcSubdivFunc) (jit_set_ip(codegen).vptr);
  start = jit_get_ip().ptr;
  jit_prolog(2);
  arg1 = jit_arg_p();
  arg2 = jit_arg_f();
  jit_movi_p(JIT_R0, p);
  jit_getarg_p(JIT_R1, arg1);
  jit_getarg_f(JIT_FPR2, arg2);
  jit_prepare(3);
    jit_pusharg_f(JIT_FPR2);
    jit_pusharg_p(JIT_R1);
    jit_pusharg_p(JIT_R0);
  jit_finish(TrampolineRtProcSubdivFunc);
  jit_ret();
  end = jit_get_ip().ptr;

  jit_flush_code(start, end);

  return callback;
};
%}

%typemap(in)(RtProcSubdivFunc) {
  $1 = MakeSCMCallbackRtProcSubdivFunc($input);
}

%inline %{
/* typedef RtVoid  ( *RtProcFreeFunc ) ( RtPointer ); */
RtVoid TrampolineRtProcFreeFunc (SCM P, RtPointer arg1)
{

  if (!scm_is_eq (scm_procedure_p (P), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtPointer) procedure %p\n",P);
    return;
  }

/*  scm_call_1(P,SWIG_NewPointerObj (arg1, SWIGTYPE_p_void, 0)); */
  scm_call_1(P,(SCM) arg1);
  return;
};

RtProcFreeFunc MakeSCMCallbackRtProcFreeFunc(SCM p)
{
  RtProcFreeFunc callback;             /* ptr to generated code */
  char          *start, *end;           /* a couple of labels */
  int arg1;

  jit_insn *codegen = (jit_insn*) malloc (1024);
  callback = (RtProcFreeFunc) (jit_set_ip(codegen).vptr);
  start = jit_get_ip().ptr;
  jit_prolog(1);
  arg1 = jit_arg_p();
  jit_movi_p(JIT_R0, p);
  jit_getarg_p(JIT_R1, arg1);
  jit_prepare(2);
    jit_pusharg_p(JIT_R1);
    jit_pusharg_p(JIT_R0);
  jit_finish(TrampolineRtProcFreeFunc);
  jit_ret();
  end = jit_get_ip().ptr;

  jit_flush_code(start, end);

  return callback;
};
%}

%typemap(in)(RtProcFreeFunc) {
  $1 = MakeSCMCallbackRtProcFreeFunc($input);
}

%typemap(in)(RtPointer data) {
  $1 = (void *) $input;
}

%inline %{
/*typedef RtFloat ( *RtFilterFunc ) ( RtFloat, RtFloat, RtFloat, RtFloat );*/
RtFloat TrampolineRtFilterFunc (SCM P, RtFloat arg1, RtFloat arg2, RtFloat arg3, RtFloat arg4)
{
  if (!scm_is_eq (scm_procedure_p (P), SCM_BOOL_T)){
    printf ("Wont call, not a Void (RtFloat,RtFloat,RtFloat,RtFloat) procedure %p\n",P);
    return 0;
  };

  RtFloat res = (RtFloat) scm_to_double(scm_call_4(P,scm_double2num(arg1),scm_double2num(arg2),scm_double2num(arg3),scm_double2num(arg4)));
  return res;
};

RtFilterFunc MakeSCMCallbackRtFilterFunc(SCM p)
{
  RtFilterFunc callback;             /* ptr to generated code */
  char          *start, *end;           /* a couple of labels */
  int arg1;
  int arg2;
  int arg3;
  int arg4;

  jit_insn *codegen = (jit_insn*) malloc (4096);
  /*callback = (RtFilterFunc) (jit_set_ip(codegen).vptr);*/
  jit_set_ip(codegen);
  callback = (RtFilterFunc) jit_get_ip().iptr;
  jit_prolog(4);
  arg1 = jit_arg_f();
  arg2 = jit_arg_f();
  arg3 = jit_arg_f();
  arg4 = jit_arg_f();

  jit_movi_p(JIT_R0, p);
  jit_getarg_f(JIT_FPR0, arg1);
  jit_getarg_f(JIT_FPR1, arg2);
  jit_getarg_f(JIT_FPR2, arg3);
  jit_getarg_f(JIT_FPR3, arg4);
  jit_prepare(1);
  jit_prepare_f(4);
    jit_pusharg_f(JIT_FPR3);
    jit_pusharg_f(JIT_FPR2);
    jit_pusharg_f(JIT_FPR1);
    jit_pusharg_f(JIT_FPR0);
    jit_pusharg_p(JIT_R0);
  jit_finish(TrampolineRtFilterFunc);
  jit_retval_f(JIT_FPRET);
  jit_ret();
  end = jit_get_ip().ptr;

  jit_flush_code((char*)callback, end);

  return callback;
};
%}

%typemap(in)(RtFilterFunc) {
  scm_display($input,scm_current_output_port());
  if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiGaussianFilter")))))){
     $1 = RiGaussianFilter;
  } else if (scm_is_true (scm_equal_p(scm_procedure_name($input),(scm_string_to_symbol(scm_from_locale_string("RiBoxFilter")))))){
     $1 = RiBoxFilter;
  } else {
  $1 = MakeSCMCallbackRtFilterFunc($input);
  };
}

/*
typedef RtVoid  ( *RtErrorFunc ) ( RtInt code, RtInt severity, RtString message );
typedef RtVoid  ( *RtArchiveCallback ) ( RtToken, char *, ... );
*/


