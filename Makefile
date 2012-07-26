CC=gcc

all: _dc1394.so

dc1394_wrap.c: dc1394.i
	swig -I/usr/local/include -python $<
	swig -python dc1394.i

_dc1394.so: dc1394_wrap.c
	$(CC) -c $< -I/usr/include/python2.6/
	$(CC) -o _dc1394.so -shared -fPIC dc1394_wrap.o -lpython2.6 -ldc1394

clean:
	rm -fv _dc1394.so dc1394_wrap.o dc1394.py dc1394_wrap.c
