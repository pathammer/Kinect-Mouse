LIB = -lglut -lGLU -lfreenect -lXtst
CFLAGS=-fPIC -g -Wall `pkg-config --cflags opencv`
LIBS = `pkg-config --libs opencv`
INC = -I/usr/local/include/libfreenect/

kmouse.out : kinect_mouse.c
	gcc $(LIB) $(CFLAGS) $(INC) kinect_mouse.c -o kmouse.out $(LIBS)
	
clean :
	rm *.out
