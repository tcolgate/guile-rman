%module rispec

%{
#include <ri.h>
#include <rif.h>
#include <limits.h>
%}
#define RI_SHARE 

%include <ports.i>
%include <cpointer.i>

%{
/* Define a helper function */
static RtInt*
convert_int_array(SCM input, int size) {
  int i;
  RtInt *result;
  if (scm_is_false(scm_u32vector_p(input))) {
    return NULL; /* DO SOMETHING USEFUL */
  };
  if (scm_to_int(scm_u32vector_length(input)) != size) {
    return NULL; /* DO SOMETHING USEFUL */
  };
  result = (RtInt*) calloc(size,sizeof(RtInt));
  for (i = 0; i < size; i++) {
      /* Since it's a uniform float vector, we know they are all floats */
      result[i] = (RtInt) scm_to_int(scm_u32vector_ref(input,scm_from_signed_integer(i)));
  };
  return result;
}

static RtFloat*
convert_float_array(SCM input, int size) {
  int i;
  RtFloat *result;
  if (scm_is_false(scm_f32vector_p(input))) {
    return NULL; /* DO SOMETHING USEFUL */
  };
  if (scm_to_int(scm_f32vector_length(input)) != size) {
    return NULL; /* DO SOMETHING USEFUL */
  };
  result = (RtFloat*) calloc(size,sizeof(RtFloat));
  for (i = 0; i < size; i++) {
      /* Since it's a uniform float vector, we know they are all floats */
      result[i] = (RtFloat) scm_to_double(scm_f32vector_ref(input,scm_from_unsigned_integer(i)));
  };
  return result;
}

static RtFloat**
convert_float_matrix(SCM input, int i, int j) {
  int ni,nj;
  RtFloat **result;
  if (!scm_is_typed_array(input,scm_string_to_symbol(scm_from_locale_string("f32")))) {
    return NULL; /* DO SOMETHING USEFUL */
  };
  result = (RtFloat**) calloc(i,sizeof(RtFloat*));
  for (ni = 0; ni < i; ni++) {
          result[ni] = (RtFloat*) calloc(j,sizeof(RtFloat));
         for (nj = 0; nj < j; nj++) {
             /* Since it's a uniform float vector, we know they are all floats */
          result[ni][nj] = (RtFloat) scm_to_double(scm_f32vector_ref(scm_array_contents(input,0),scm_from_unsigned_integer(ni*(i) + nj)));
          };
  };
  return result;
}
%}
%typemap(in) RtFloat NAME[ANY] {
    $1 = convert_float_array($input, $1_dim0);
    if (!$1) return NULL;
}

%typemap(freearg)(RtFloat NAME[ANY] ){
  free($1);
}

%apply(RtFloat NAME[ANY] ){
  (RtColor Cq)
  (RtColor Os)
}
%apply(RtFloat NAME[ANY] ){
  (RtPoint point1)
  (RtPoint point2)
}
%apply(RtFloat NAME[ANY] ){
  (RtBound bound)
}

%typemap(in) RtFloat NAME[ANY][ANY] {
    $1 = ($1_ltype) convert_float_matrix($input, $1_dim0, $1_dim1);
    if (!$1) return NULL;
}

%typemap(freearg)(RtFloat NAME[ANY][ANY]){
  free($1);
}
%apply(RtFloat NAME[ANY][ANY] ){
  (RtBasis ubasis)
  (RtBasis vbasis)
}
%apply(RtFloat NAME[ANY][ANY] ){
  (RtMatrix transform)
}


%include <ritypes.h>


%{

RtPointer convert_param_item_float() {
};

RtPointer convert_param_item_element(RifTokenType tok_type,
                                     RifTokenDetail tok_detail,
                                     SCM value){
  switch(tok_type){
    case k_RifFloat: {
      RtFloat *val = (RtFloat*)malloc(sizeof (RtFloat));
      *val = (RtFloat)scm_to_double(value);
      return (RtPointer) val;
    }; break;
    case k_RifInteger: {
      RtInt *val = (RtInt*)malloc(sizeof (RtInt));
      *val = scm_to_int(value) ;
      return (RtPointer) val;
    }; break;
    case k_RifString: {
      RtToken *val = (RtToken*)malloc(sizeof (RtToken));
      *val = scm_to_locale_string(value) ;
      return (RtPointer) val;
    }; break;
    case k_RifPoint:
    case k_RifColor:
    case k_RifVector:
    case k_RifNormal: {
      int size = scm_to_int(scm_f32vector_length(value));
      RtFloat* val = convert_float_array(value, size);
      return (RtPointer) val;
    }; break;
    case k_RifHPoint:
    case k_RifMatrix:
    case k_RifMPoint:
    default:
      break;
  };

  scm_display(scm_from_locale_string ("Unkown value type in param list"),scm_current_error_port ());
  return (RtPointer) NULL;
}

RtPointer convert_param_item_array(SCM token,
                                   RifTokenType tok_type, 
                                   RifTokenDetail tok_detail, 
                                   RtInt tok_arraysize,
                                   SCM value){
  RtPointer result = (RtPointer) NULL;

  if(tok_arraysize > 1){
    if(!scm_is_true(scm_list_p(value)) || (scm_to_uint(scm_length(value)) != tok_arraysize)){
        scm_display(scm_from_locale_string("Token "), scm_current_error_port ());
        scm_display(token, scm_current_error_port ());
        scm_display(scm_from_locale_string(" expects array of length "), scm_current_error_port ());
        scm_display(scm_from_signed_integer(tok_arraysize), scm_current_error_port());
        scm_newline(scm_current_error_port ());
        return (RtPointer) NULL; /* DO SOMETHING USEFUL */
    }
  } else {
    if(scm_is_true(scm_list_p(value)) && (scm_to_uint(scm_length(value)) != 1)){
        scm_display(scm_from_locale_string("Token "), scm_current_error_port ());
        scm_display(token, scm_current_error_port ());
        scm_display(scm_from_locale_string(" expects a single value."), scm_current_error_port ());
        scm_newline(scm_current_error_port ());
        return (RtPointer) NULL; /* DO SOMETHING USEFUL */
    }
  }

  if(scm_is_true(scm_list_p(value))){
    RtPointer* arrayresult = (RtPointer*) malloc(sizeof(RtPointer) * tok_arraysize);
    int i;
    for (i = 0 ; i < tok_arraysize ; i++){
      arrayresult[i] =  convert_param_item_element(tok_type, tok_detail, scm_list_ref(value, scm_from_signed_integer(i)));
    };
    result = (RtPointer) arrayresult;
  } else {
    result = convert_param_item_element(tok_type, tok_detail, value);
  };
  
  return result;
};

static int
convert_param_list(SCM input, RtInt* count, RtToken *tokens[], RtPointer *values[]) {
  int length;
  int i;
  if (scm_is_false((scm_list_p(input)))) {
    scm_display(scm_from_locale_string ("Parameter list required"),scm_current_error_port ());
    return 0; /* DO SOMETHING USEFUL */
  };
  length = scm_to_int(scm_length(input));
  if (scm_is_false(scm_even_p(scm_from_int(length)))) {
    scm_display(scm_from_locale_string ("Parameter list requires an even number of tokens and values"),scm_current_error_port ());
    return 0; /* DO SOMETHING USEFUL */
  };
  *count = (RtInt) length/2;
  *tokens = (RtToken*) calloc(*count,sizeof(RtToken));
  *values = (RtPointer*) calloc(*count,sizeof(RtPointer));
  for (i = 0; i < length; i+=2) {
    /* check the strings */
    /* check the values  and conver from appropriate type*/
    SCM token = scm_list_ref(input,scm_from_int(i));
    SCM value = scm_list_ref(input,scm_from_int(i+1));
    RifTokenType tok_decl_type;
    RifTokenDetail tok_decl_detail;
    RtInt tok_decl_arraysize;

    if (scm_is_false(scm_string_p(token))) {
      scm_display(scm_from_locale_string ("Tokens must be strings in param list"),scm_current_error_port ());
      return 0; /* DO SOMETHING USEFUL */
    };
    (*tokens)[i/2] = (RtToken) scm_to_locale_string(token);

    /* Determine the correct type for this token */
    if (RifGetDeclaration ((RtToken) scm_to_locale_string(token),
                           &tok_decl_type,
                           &tok_decl_detail,
                           &tok_decl_arraysize)){
      scm_display(scm_from_locale_string ("Uknown token variable: "),scm_current_error_port ());
      scm_display(token,scm_current_error_port ());
      scm_newline(scm_current_error_port ());
      return 0; /* DO SOMETHING USEFUL */
    };

    (*values)[i/2] = convert_param_item_array(token,
                                              tok_decl_type,
                                              tok_decl_detail,
                                              tok_decl_arraysize,
                                              value);
  };

  return 1;
}
%}

%typemap(in)(RtInt , RtToken* , RtPointer* ){
  if(!convert_param_list($input,&$1,&$2,&$3))
      scm_misc_error (NULL, "unknown value type", SCM_UNSPECIFIED);
}

%typemap(default)( RtInt , RtToken* , RtPointer* ){
  /* need to convert a string list to a token list */
  $1 = 0;
  $2 = (RtToken*) RI_NULL;
  $3 = (RtPointer*) RI_NULL;
}

%apply( RtInt , RtToken* , RtPointer* ){
  (RtInt count, RtToken tokens[], RtPointer values[] )
}

%typemap(in,numinputs=0)(RifTokenType* , RifTokenDetail*, RtInt*){
  // allocate space for return details
  $1 = (RifTokenType*)malloc(sizeof(RifTokenType));
  $2 = (RifTokenDetail*)malloc(sizeof(RifTokenDetail));
  $3 = (RtInt*)malloc(sizeof(RtInt));
}

%typemap(argout)(RifTokenType* , RifTokenDetail*, RtInt*){
  int i = 0;
  SCM retval = SCM_UNSPECIFIED;

  if(result){
    retval = SCM_UNSPECIFIED;
  };

  gswig_result = retval;
  free($1);
  free($2);
  free($3);
}

%apply( RifTokenType* , RifTokenDetail*, RtInt* ){
   (RifTokenType *tokType, RifTokenDetail *tokDetail, RtInt *arrayLen)
}



%include "help.i"
%include <aqsis/config.h>
%include <ri.h>
%include <rif.h>

%include "ignores.i"
%include <ri.inl>

#ifdef RI2RIB
%goops %{ 
(load-extension "libguile_rman_ri2rib.so" "scm_init_rman_ri2rib_module")
(use-modules (oop goops))
(define token-dict (make <CqTokenDictionary> #:args '(#t)))
%}
#else
%goops %{ 
(load-extension "libguile_rman_rispec.so" "scm_init_rman_rispec_module")
(use-modules (oop goops))
(define token-dict (make <CqTokenDictionary> #:args '(#t)))
%}
#endif



