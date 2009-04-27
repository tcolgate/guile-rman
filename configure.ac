#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

#AC_PREREQ(2.61)
AC_INIT(guile-rman, 0.1.1, tcolgate@gmail.com)

# Checks for programs.
AC_PROG_CC
AC_PROG_CXX
AC_PROG_LIBTOOL
AC_PROG_SWIG
AM_INIT_AUTOMAKE
PKG_CHECK_MODULES(FFI,libffi)
AC_SUBST(FFI_CFLAGS)
AC_SUBST(FFI_LIBS)
AC_CONFIG_HEADER(config.h)
GUILE_PROGS
GUILE_FLAGS
GUILE_SITE_DIR

# Checks for libraries.
AM_CONDITIONAL(LIGHTNING_MAIN, (exit 1))
AC_CHECK_LIB([aqsis], [RiBegin])

# Checks for header files.
AC_CHECK_HEADERS([ri.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile])
AC_OUTPUT(src/Makefile tests/Makefile)

