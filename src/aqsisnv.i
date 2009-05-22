%module aqsisnv

%{
#include <aqsis_config.h>
#include <exception.h>
#include <interpclasscounts.h>
#include <enum.h>
#include <primvartype.h>
#include <primvartoken.h>
#include <tokendictionary.h>
%}

%include <std_common.i>
%include <std_vector.i>
%include <std_string.i>
%include <std_except.i>
%include <aqsis_config.h>
%include <exception.h>
%include <interpclasscounts.h>
%include <enum.h>
%include <primvartype.h>
%include <primvartoken.h>

%exception CqTokenDictionary::parseAndLookup {
    try {
        $action
    } 
    catch (MemoryError) {
        croak("Out of memory");
    }
}

%include <tokendictionary.h>


%goops %{ (load-extension "libguile_rman_aqsisnv.so" "scm_init_rman_aqsisnv_module")%}

