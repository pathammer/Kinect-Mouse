<<<<<<< HEAD
LIB = -lglut -lGLU -lfreenect -lcv -lhighgui -lcvaux -lX11 -lXtst
INC = -I/usr/local/include/libfreenect/
OLIB = -lglut -lGLU -lfreenect -lcv -lhighgui -lcvaux -lX11 -lXtst
OINC = -I/usr/local/include/libfreenect/
old : kinect_mouse.c
	gcc $(OLIB) $(OINC) kinect_mouse.c -o old-mouse.out 
	
clean :
	rm *.out
	
all : finger.cpp
	g++ $(LIB) $(INC) finger.cpp -o kmouse.out
=======
LIB = -lglut -lGLU -lfreenect -lXtst
CFLAGS=-fPIC -g -Wall `pkg-config --cflags opencv`
LIBS = `pkg-config --libs opencv`
INC = -I/usr/local/include/libfreenect/

kmouse.out : kinect_mouse.c
	gcc $(LIB) $(CFLAGS) $(INC) kinect_mouse.c -o kmouse.out $(LIBS)
	
clean :
	rm *.out
>>>>>>> 34de0c3ca3d4cfa2782bddb21abeb50b9d15913e
