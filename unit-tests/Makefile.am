TESTS=test-ri2rib.scm  test-rispec.scm  test-utilities.scm

TESTS_ENVIRONMENT=\
	GUILE_AUTO_COMPILE=0	\
	$(top_srcdir)/dev-environ guile -L $(top_srcdir)/src -s

%.check: %
	$(TESTS_ENVIRONMENT) $(srcdir)/$*

EXTRA_DIST=$(TESTS)

