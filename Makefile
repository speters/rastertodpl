
EXEC=rastertodpl
CFLAGS = -O3 $(shell cups-config --cflags)
LDFLAGS = $(shell cups-config --ldflags)
LDLIBS = $(shell cups-config --image --libs)
CUPSDATADIR = $(shell cups-config --datadir)
PPDPATH=${CUPSDATADIR}/model
CUPSDIR = $(shell cups-config --serverbin)

all: rastertodpl ppd

.PHONY: ppd clean install uninstall

$(EXEC): rastertodpl.c

ppd:
	ppdc dpl.drv

install:
	install -s $(EXEC) $(CUPSDIR)/filter/
	install -m 644 dpl.drv $(CUPSDATADIR)/drv/
#	install -m 644 dplmedia.h $(CUPSDATADIR)/ppdc/
	

uninstall:
	rm -f $(CUPSDIR)/filter/$(EXEC)
	rm -f $(CUPSDATADIR)/drv/dpl.drv
	rm -f $(CUPSDATADIR)/ppdc/dplmedia.h


clean:
	rm -f rastertodpl
	rm -rf ppd
