#
# QMiner makefile
#
# Prerequisites for documentation:
#  - doxygen:  sudo apt-get install doxygen
#  - GraphViz: sudo apt-get install graphviz
#

include ./Makefile.config

# QMiner version
VERSION = 0.5.0

# dependencies
THIRD_PARTY = src/third_party
LIBUV = $(THIRD_PARTY)/libuv
LIBV8 = $(THIRD_PARTY)/v8/out/x64.release/obj.target/tools/gyp
GLIB = src/glib
QMINER = src/qminer
BUILD = build

# lib includes
STATIC_LIBS = $(GLIB)/glib.a $(LIBUV)/libuv.a \
	$(LIBV8)/libv8_base.x64.a $(LIBV8)/libv8_snapshot.a

# QMiner code
QMOBJS = $(QMINER)/qminer_core.o $(QMINER)/qminer_ftr.o $(QMINER)/qminer_aggr.o \
	$(QMINER)/qminer_op.o $(QMINER)/qminer_gs.o $(QMINER)/qminer_js.o \
	$(QMINER)/qminer_srv.o $(QMINER)/qminer_gs_srv.o
MAINOBJ = $(QMINER)/main.o

all: qm

qm:
	# compile glib
	make -C $(GLIB)
	# compile qminer
	make -C $(QMINER)
	# create qm commandline tool
	$(CC) -o qm $(QMOBJS) $(MAINOBJ) $(STATIC_LIBS) $(LDFLAGS) $(LIBS) 
	# create qminer static library
	rm -f qm.a
	ar -cvq qm.a $(QMOBJS)
	# prepare instalation directory
	mkdir -p $(BUILD)
	# move in qm commandline tool
	mv ./qm ./$(BUILD)/
	# copy in unicode definiton files
	cp ../glib/bin/UnicodeDef.Bin ./$(BUILD)/
	# copy in javascript libraries
	mkdir -p ./$(BUILD)/lib
	cp -r ./$(QMINER)/js/* ./build/lib
	# copy in admin GUI
	mkdir -p ./$(BUILD)/gui
	cp -r ./$(QMINER)/gui/* ./$(BUILD)/gui
	
cleanall: clean cleandoc
	make -C $(THIRD_PARTY) clean
	make -C $(GLIB) clean

clean:
	make -C $(QMINER) clean
	rm -f *.o *.gch *.a qm
	rm -rf ./$(BUILD)/

lib:
	make -C $(THIRD_PARTY)

install: 
	# prepare installation directory
	mkdir /usr/local/qm-$(VERSION)
	# copy build to installation dir
	cp -r ./$(BUILD)/* /usr/local/qm-$(VERSION)
	# create link for qm commandline tool
	ln /usr/local/qm-$(VERSION)/qm /usr/local/bin/qm
	# set QMINER_HOME environment variable
	echo "QMINER_HOME=/usr/local/qm-$(VERSION)/\nexport QMINER_HOME" > qm.sh
	mv ./qm.sh /etc/profile.d/
	
uninstall:
	# delete installation
	rm -rf /usr/local/qm-$(VERSION)
	# delete link
	rm /usr/local/bin/qm
	# delete environment
	rm /etc/profile.d/qm.sh

doc: cleandoc
	rm -rf doc log-doxygen-dev.txt
	sed "s/00000000/$(DOXYGEN_STIME)/" Doxyfile | sed "s/11111111/$(DOXYGEN_SLVER)/" > Doxyfile-tmp
	$(DOXYGEN) Doxyfile-tmp

cleandoc:
	rm -rf doc
	rm -rf Doxyfile-tmp
	rm -rf log-doxygen.txt

installdoc: doc
	scp -r doc blazf@agava:www/qminer-$(DOXYGEN_TIME)
	ssh blazf@agava ln -fsn qminer-$(DOXYGEN_TIME) www/qminer

