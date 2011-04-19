LIB = -lglut -lGLU -lfreenect -lcv -lhighgui -lcvaux
INC = -I/usr/local/include/libfreenect/
OLIB = -lglut -lGLU -lfreenect -lcv -lhighgui -lcvaux
OINC = -I/usr/local/include/libfreenect/
old : kinect_mouse.c
	gcc $(OLIB) $(OINC) kinect_mouse.c -o old-mouse.out 
	
clean :
	rm *.out
	
all : finger.cpp
	g++ $(LIB) $(INC) finger.cpp -o kmouse.out