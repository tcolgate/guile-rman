#lib_LTLIBRARIES=libguile_rman_rispec.la  libguile_rman_ri2rib.la libguile_rman_aqsisnv.la
lib_LTLIBRARIES=libguile_rman_rispec.la  libguile_rman_ri2rib.la 

GUILE_CFLAGS  = @GUILE_CFLAGS@
GUILE_LDFLAGS = @GUILE_LDFLAGS@

SWIG_FLAGS = -guile -Linkage module -package rman -scm -proxy -emit-setters -I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis

rispec_wrap.c: rispec.i ignores.i help.i
	$(SWIG) $(SWIG_FLAGS) -I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis -module rispec -o $@ $<

ri2rib_wrap.c: rispec.i ignores.i help.i
	$(SWIG) -DRI2RIB $(SWIG_FLAGS) -I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis -module ri2rib -o $@ $<

#aqsisnv_wrap.cpp: aqsisnv.i
#	$(SWIG) $(SWIG_FLAGS) -c++ -I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis -module aqsisnv -o $@ $<

libguile_rman_rispec_la_CFLAGS=-I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis @FFI_CFLAGS@
libguile_rman_rispec_la_SOURCES=rispec_wrap.c
libguile_rman_rispec_la_LDFLAGS=-module -laqsis_core @FFI_LIBS@

libguile_rman_ri2rib_la_CFLAGS=-I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis @FFI_CFLAGS@
libguile_rman_ri2rib_la_SOURCES=ri2rib_wrap.c
libguile_rman_ri2rib_la_LDFLAGS=-module -laqsis_ri2rib @FFI_LIBS@

#libguile_rman_aqsisnv_la_CFLAGS=-I/usr/local/include/aqsis/aqsis/ri -I/usr/local/include/aqsis
#libguile_rman_aqsisnv_la_SOURCES=aqsisnv_wrap.cpp
#libguile_rman_aqsisnv_la_LDFLAGS=-module -laqsis_types 

EXTRA_DIST = rman rman/rispec.scm rman/ri2rib.scm rman/utilities.scm Swig/common.scm
guilermandir =  /usr/local/share/guile/site/rman
#guilerman_DATA = rman/rispec.scm rman/ri2rib.scm rman/aqsisnv.scm rman/utilities.scm
guilerman_DATA = rman/rispec.scm rman/ri2rib.scm rman/utilities.scm
swigdir = /usr/local/share/guile/site/Swig
swig_DATA = Swig/common.scm

