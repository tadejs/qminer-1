#
# GLib makefile
#

include ../../Makefile.config

# library headers include
LIBUV = ../third_party/libuv/include
BASE = ./base/
MINE = ./mine/
# main object files
MAINOBJS = base.o net.o mine.o thread.o

#entry point
all: libuv glib

# create libuv
libuv:
	make -C ../third_party/libuv

# create glib static library
glib: $(MAINOBJS) $(MISCOBJS)
	rm -f glib.a
	ar -cvq glib.a $(MAINOBJS) $(MISCOBJS)

base.o: ./base/*.h ./base/*.cpp
	$(CC) -c $(CXXFLAGS) ./base/base.cpp $(LDFLAGS) $(LIBS)

net.o: ./net/*.h ./net/*.cpp
	$(CC) -c $(CXXFLAGS) ./net/net.cpp -I$(BASE) -I$(LIBUV) $(LDFLAGS) $(LIBS)

mine.o: ./mine/*.h ./mine/*.cpp
	$(CC) -c $(CXXFLAGS) ./mine/mine.cpp -I$(BASE) $(LDFLAGS) $(LIBS)

thread.o: ./concurrent/*.h ./concurrent/*.cpp ./concurrent/posix/*.h ./concurrent/posix/*.cpp
	$(CC) -c $(CXXFLAGS) ./concurrent/thread.cpp -I$(BASE) $(LDFLAGS) $(LIBS)

clean:
	rm -f *.o *.gch *.a
