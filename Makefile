LIB = -lglut -lGLU -lfreenect -lcv -lhighgui -lcvaux
INC = -I/usr/local/include/libfreenect/

kmouse.out : kinect_mouse.c
	gcc $(LIB) $(INC) kinect_mouse.c -o kmouse.out 
	
clean :
	rm *.out