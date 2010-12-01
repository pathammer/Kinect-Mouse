/*
 * This file is part of the OpenKinect Project. http://www.openkinect.org
 *
 * Copyright (c) 2010 individual OpenKinect contributors. See the CONTRIB file
 * for details.
 *
 * This code is licensed to you under the terms of the Apache License, version
 * 2.0, or, at your option, the terms of the GNU General Public License,
 * version 2.0. See the APACHE20 and GPL2 files for the text of the licenses,
 * or the following URLs:
 * http://www.apache.org/licenses/LICENSE-2.0
 * http://www.gnu.org/licenses/gpl-2.0.txt
 *
 * If you redistribute this file in source form, modified or unmodified, you
 * may:
 *   1) Leave this header intact and distribute it under the same terms,
 *      accompanying it with the APACHE20 and GPL20 files, or
 *   2) Delete the Apache 2.0 clause and accompany it with the GPL2 file, or
 *   3) Delete the GPL v2 clause and accompany it with the APACHE20 file
 * In all cases you must keep the copyright notice intact and include a copy
 * of the CONTRIB file.
 *
 * Binary distributions must follow the binary distribution requirements of
 * either License.
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "libfreenect.h"

#include <assert.h>
#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <X11/extensions/XTest.h>

#include <pthread.h>

#if defined(__APPLE__)
#include <GLUT/glut.h>
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#else
#include <GL/glut.h>
#include <GL/gl.h>
#include <GL/glu.h>
#endif

#include <math.h>

#define SCREEN (DefaultScreen(display))

int depth;
char *display_name;

Display *display;
Window main_window;
Window root_window;

pthread_t freenect_thread;
volatile int die = 0;

int g_argc;
char **g_argv;

int window;

float tmprot = 1;

pthread_mutex_t gl_backbuf_mutex = PTHREAD_MUTEX_INITIALIZER;

uint8_t gl_depth_front[640*480*4];
uint8_t gl_depth_back[640*480*4];

uint8_t gl_rgb_front[640*480*4];
uint8_t gl_rgb_back[640*480*4];

GLuint gl_depth_tex;
GLuint gl_rgb_tex;

freenect_context *f_ctx;
freenect_device *f_dev;

int freenect_angle = 17;
int freenect_led;


float pointerx = 0, pointery = 0;
float mousex = 0, mousey = 0;
float tmousex = 0, tmousey = 0;
int screenw = 0, screenh = 0;
int snstvty;

int pause = 0;
int pusx = 0, pusy = 0; 


pthread_cond_t gl_frame_cond = PTHREAD_COND_INITIALIZER;
int got_frames = 0;

void DrawGLScene()
{
	pthread_mutex_lock(&gl_backbuf_mutex);

	while (got_frames < 2) {
		pthread_cond_wait(&gl_frame_cond, &gl_backbuf_mutex);
	}

	memcpy(gl_depth_front, gl_depth_back, sizeof(gl_depth_back));
	memcpy(gl_rgb_front, gl_rgb_back, sizeof(gl_rgb_back));
	got_frames = 0;
	pthread_mutex_unlock(&gl_backbuf_mutex);

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();

	glEnable(GL_TEXTURE_2D);

	glBindTexture(GL_TEXTURE_2D, gl_depth_tex);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, 640, 480, 0, GL_RGB, GL_UNSIGNED_BYTE, gl_depth_front);

	glTranslated(1280, 0, 0);
	glScalef(-1, 1, 1);

	glBegin(GL_TRIANGLE_FAN);
	glColor4f(255.0f, 255.0f, 255.0f, 255.0f);
	glTexCoord2f(0, 0); glVertex3f(0,0,0);
	glTexCoord2f(1, 0); glVertex3f(640,0,0);
	glTexCoord2f(1, 1); glVertex3f(640,480,0);
	glTexCoord2f(0, 1); glVertex3f(0,480,0);
	glEnd();

	glBindTexture(GL_TEXTURE_2D, gl_rgb_tex);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, 640, 480, 0, GL_RGB, GL_UNSIGNED_BYTE, gl_rgb_front);

	glBegin(GL_TRIANGLE_FAN);
	glColor4f(255.0f, 255.0f, 255.0f, 255.0f);
	glTexCoord2f(0, 0); glVertex3f(640,0,0);
	glTexCoord2f(1, 0); glVertex3f(1280,0,0);
	glTexCoord2f(1, 1); glVertex3f(1280,480,0);
	glTexCoord2f(0, 1); glVertex3f(640,480,0);
	glEnd();

	glutSwapBuffers();
}

void keyPressed(unsigned char key, int x, int y)
{
	switch(key) {
		case 27:
			die = 1;
			pthread_join(freenect_thread, NULL);
			glutDestroyWindow(window);
			pthread_exit(NULL);
		break;
		case 'w':
			if (freenect_angle < 29) freenect_angle++;
			freenect_set_tilt_degs(f_dev,freenect_angle);
			printf("\nAngle: %d degrees\n", freenect_angle);
		break;
		case 's':
			freenect_angle = 0;
			freenect_set_tilt_degs(f_dev,freenect_angle);
			printf("\nAngle: %d degrees\n", freenect_angle);
		break;
		case 'x':
			if (freenect_angle > -30) freenect_angle--;
			freenect_set_tilt_degs(f_dev,freenect_angle);
			printf("\nAngle: %d degrees\n", freenect_angle);
		break;
		case '1':
			freenect_set_led(f_dev,LED_GREEN);
		break;
		case '2':
			freenect_set_led(f_dev,LED_RED);
		break;
		case '3':
			freenect_set_led(f_dev,LED_YELLOW);
		break;
		case '4':
			freenect_set_led(f_dev,LED_BLINK_YELLOW);
		break;
		case '5':
			freenect_set_led(f_dev,LED_BLINK_GREEN);
		break;
		case '6':
			freenect_set_led(f_dev,LED_BLINK_RED_YELLOW);
		break;
		case '0':
			freenect_set_led(f_dev,LED_OFF);
		break;
		case 'o':
			tmprot+=0.1;
			printf("\n %f \n", tmprot);
		break;
		case 'p':
			tmprot-=0.1;
			printf("\n %f \n", tmprot);
		break;
	}

}

void ReSizeGLScene(int Width, int Height)
{
	glViewport(0,0,Width,Height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho (0, 1280, 480, 0, -1.0f, 1.0f);
	glMatrixMode(GL_MODELVIEW);
}

void InitGL(int Width, int Height)
{
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
	glClearDepth(1.0);
	glDepthFunc(GL_LESS);
	glDisable(GL_DEPTH_TEST);
	glEnable(GL_BLEND);
	glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glShadeModel(GL_SMOOTH);
	glGenTextures(1, &gl_depth_tex);
	glBindTexture(GL_TEXTURE_2D, gl_depth_tex);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glGenTextures(1, &gl_rgb_tex);
	glBindTexture(GL_TEXTURE_2D, gl_rgb_tex);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	ReSizeGLScene(Width, Height);
}

void *gl_threadfunc(void *arg)
{
	printf("GL thread\n");

	glutInit(&g_argc, g_argv);

	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH);
	glutInitWindowSize(1280, 480);
	glutInitWindowPosition(0, 0);

	window = glutCreateWindow("Ooblik's Kinect Demo");

	glutDisplayFunc(&DrawGLScene);
	glutIdleFunc(&DrawGLScene);
	glutReshapeFunc(&ReSizeGLScene);
	glutKeyboardFunc(&keyPressed);

	InitGL(1280, 480);

	glutMainLoop();

	return NULL;
}

uint16_t t_gamma[2048];

void depth_cb(freenect_device *dev, void *v_depth, uint32_t timestamp)
{
	int i;
	int first = 0;
	int px = 0 , py = 0;
	int tx = 0 , ty = 0;
	int alert = 0;
	freenect_depth *depth = v_depth;

	pthread_mutex_lock(&gl_backbuf_mutex);
	for (i=0; i<FREENECT_FRAME_PIX; i++) {
		int pval = t_gamma[depth[i]];
		int lb = pval & 0xff;
		
		tx++;
		if(tx >= 640) {
			tx = 0;		
			ty++;
		}
		/*case 0-5*/
		switch (pval>>8) {
			case 0:
				gl_depth_back[3*i+0] = 255;
				gl_depth_back[3*i+1] = 0;
				gl_depth_back[3*i+2] = 0;
				alert++;
				if (!first) { 
					first = i;
					px = tx;
					py = ty;				
				}
				break;
			case 1:
				gl_depth_back[3*i+0] = 255;
				gl_depth_back[3*i+1] = 255;
				gl_depth_back[3*i+2] = 255;
				break;
			default:
				gl_depth_back[3*i+0] = 0;
				gl_depth_back[3*i+1] = 0;
				gl_depth_back[3*i+2] = 0;
				break;
		}
	}

	if(alert > snstvty) {	
		printf("\n!!!TOO CLOSE!!!\n");

	} else {
		if(first) {
			pointerx = ((px-640.0f) / -1);
			pointery = (py);
			mousex = ((pointerx / 630.0f) * screenw);
			mousey = ((pointery / 470.0f) * screenh);
			int mx , my;
			mx = mousex;
			my = mousey;

			if(mx > tmousex) tmousex+= (mx - tmousex) / 7;
			if(mx < tmousex) tmousex-= (tmousex - mx) / 7;
			if(my > tmousey) tmousey+= (my - tmousey) / 7;
			if(my < tmousey) tmousey-= (tmousey - my) / 7;			
			
			if((pusx <= (mx + 15))  && (pusx >= (mx - 15)) && (pusy <= (my + 15))  && (pusy >= (my - 15))) {
				pause++;
				printf("\n%d\n", pause);
			} else {
				pusx = mx;
				pusy = my;
				pause = 0;
			}		
			
			if(pause > 15) {
				pause = -30;
				XTestFakeButtonEvent(display, 1, TRUE, CurrentTime);
				XTestFakeButtonEvent(display, 1, FALSE, CurrentTime);
			}

			//printf("-- %d x %d -- \n", mx, my);

			XTestFakeMotionEvent(display, -1, tmousex-200, tmousey-200, CurrentTime);
			XSync(display, 0);

			//printf("\n\n %d  -  %d \n\n", mx, my);

			
		}
	}


	got_frames++;
	pthread_cond_signal(&gl_frame_cond);
	pthread_mutex_unlock(&gl_backbuf_mutex);
}

void rgb_cb(freenect_device *dev, freenect_pixel *rgb, uint32_t timestamp)
{
	pthread_mutex_lock(&gl_backbuf_mutex);
	got_frames++;
	memcpy(gl_rgb_back, rgb, FREENECT_RGB_SIZE);
	pthread_cond_signal(&gl_frame_cond);
	pthread_mutex_unlock(&gl_backbuf_mutex);
}

void *freenect_threadfunc(void *arg)
{
	freenect_set_tilt_degs(f_dev,freenect_angle);
	freenect_set_led(f_dev,LED_GREEN);
	freenect_set_depth_callback(f_dev, depth_cb);
	freenect_set_rgb_callback(f_dev, rgb_cb);
	freenect_set_rgb_format(f_dev, FREENECT_FORMAT_RGB);
	freenect_set_depth_format(f_dev, FREENECT_FORMAT_11_BIT);

	freenect_start_depth(f_dev);
	freenect_start_rgb(f_dev);

	printf("'W'-Tilt Up, 'S'-Level, 'X'-Tilt Down, '0'-'6'-LED Mode\n");

	while(!die && freenect_process_events(f_ctx) >= 0 )
	{
		int16_t ax,ay,az;
		freenect_get_raw_accel(f_dev, &ax, &ay, &az);
		double dx,dy,dz;
		freenect_get_mks_accel(f_dev, &dx, &dy, &dz);
		//printf("\r raw acceleration: %4d %4d %4d  mks acceleration: %4f %4f %4f\r", ax, ay, az, dx, dy, dz);
		fflush(stdout);
	}

	printf("\nShutting Down Streams...\n");

	freenect_stop_depth(f_dev);
	freenect_stop_rgb(f_dev);

	freenect_close_device(f_dev);
	freenect_shutdown(f_ctx);

	printf("-- done!\n");
	return NULL;
}


int main(int argc, char **argv)
{
	int res;

	printf("\n===Kinect Mouse===\n");

	if (argc == 2) {
		snstvty = atoi(argv[1]);
	} else {
		snstvty = 20000;
	}

	mousemask(ALL_MOUSE_EVENTS, NULL);

	display = XOpenDisplay(0);

	root_window = DefaultRootWindow(display);

	screenw = XDisplayWidth(display, SCREEN);
	screenh = XDisplayHeight(display, SCREEN);

	printf("\nDefault Display Found\n");
	printf("\nSize: %dx%d\n", screenw, screenh);

	screenw += 200;
	screenh += 200;

	int i;
	for (i=0; i<2048; i++) {
		float v = i/2048.0;
		v = powf(v, 3)* 6;
		t_gamma[i] = v*6*256;
	}

	g_argc = argc;
	g_argv = argv;

	if (freenect_init(&f_ctx, NULL) < 0) {
		printf("freenect_init() failed\n");
		return 1;
	}

	freenect_set_log_level(f_ctx, FREENECT_LOG_DEBUG);

	int nr_devices = freenect_num_devices (f_ctx);
	printf ("\nNumber of Devices Found: %d\n", nr_devices);

	int user_device_number = 0;
	if (argc > 1)
		user_device_number = atoi(argv[1]);

	if (nr_devices < 1)
		return 1;

	if (freenect_open_device(f_ctx, &f_dev, user_device_number) < 0) {
		printf("\nCOULD NOT LOCATE KINECT :(\n");
		return 1;
	}

	res = pthread_create(&freenect_thread, NULL, freenect_threadfunc, NULL);
	if (res) {
		printf("Could Not Create Thread\n");
		return 1;
	}

	gl_threadfunc(NULL);

	return 0;
}
