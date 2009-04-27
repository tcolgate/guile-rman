lib_LTLIBRARIES=libguile_rman_rispec.la 

GUILE_CFLAGS  = @GUILE_CFLAGS@
GUILE_LDFLAGS = @GUILE_LDFLAGS@

SWIG_FLAGS = -guile -Linkage module -package rman -scm -proxy -emit-setters -I/usr/local/include/aqsis 

rispec_wrap.c: rispec.i ignores.i help.i
	$(SWIG) $(SWIG_FLAGS) -module rispec -o $@ $<

libguile_rman_rispec_la_CFLAGS=-I../lightning -I/usr/local/include/aqsis @FFI_CFLAGS@
libguile_rman_rispec_la_SOURCES=rispec_wrap.c
libguile_rman_rispec_la_LDFLAGS=-module -L/usr/local/include -laqsis @FFI_LIBS@

EXTRA_DIST = rman rman/rispec.scm rman/utilities.scm Swig Swig/common.scm rispec.i ignores.i help.i
guilermandir =  @GUILE_SITE@/rman
guilerman_DATA = rman/rispec.scm rman/utilities.scm 
guileswigdir =  @GUILE_SITE@/Swig
guileswig_DATA = Swig/common.scm

