/*
  Kinect Mouse
  NYU - Motion Capture Class Spring 2011 Project
  http://movement.nyu.edu/mocap11s/
  This file was adapted from OpenKinect Project's glview.c demo file
  That file was modified by Tim Flaman to X11 mouse movement which inspired this file
  This version of the file adds more advanced openCV hand tracking
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
#include <iostream>

// tuio
//#include "TuioServer.h"

// opencv
#pragma comment(lib, "cxcore210d.lib")
#pragma comment(lib, "cv210d.lib")
#pragma comment(lib, "highgui210d.lib")
#include <opencv/highgui.h>
#include <opencv/cv.h>

#include <pthread.h>

//kinect
//#include <CLNUIDevice.h>
//#pragma comment(lib, "CLNUIDevice.lib")

//MOUSE
//X11 control Should be able to delete these after utouch integration
#include <assert.h>
#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <X11/extensions/XTest.h>

#include <evemu.h>//utouch multi-touch event emulation

#include <libfreenect.h>//kinect driver by openkinect

#define SCREEN (DefaultScreen(display))


int depth;
char *display_name;

Display *display;
Window main_window;
Window root_window;

freenect_context *f_ctx;
freenect_device *f_dev;
int freenect_angle = 17;
int freenect_led;

int snstvty = 0;
int hold = 0;
float pointerx = 0, pointery = 0;
float mousex = 0, mousey = 0;
float tmousex = 0, tmousey = 0;
int screenw = 0, screenh = 0;
int pusx = 0, pusy = 0; //got to change this sometime

int key;

uint8_t gl_depth_front[640*480*4];
uint8_t gl_depth_back[640*480*4];

uint8_t gl_rgb_front[640*480*4];
uint8_t gl_rgb_back[640*480*4];

uint16_t t_gamma[2048];

std::vector<cv::Point2i> fingerTips;
cv::Mat x(480, 640, CV_32FC1);
cv::Mat y(480, 640, CV_32FC1);
cv::Mat z(480, 640, CV_32FC1);
cv::Mat debugFrame(480, 640, CV_32FC1);
cv::Scalar center;

pthread_t freenect_thread;
pthread_mutex_t gl_backbuf_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t gl_frame_cond = PTHREAD_COND_INITIALIZER;

std::vector<cv::Point2i> detectFingertips() {
  using namespace cv;
  using namespace std;
  bool debug = 1;

  float zMin = 0.0f;
  float zMax = 0.75f;
  
  vector<Point2i> fingerTips;

  Mat handMask = z < zMax & z > zMin;

  std::vector<std::vector<cv::Point> > contours;
  findContours(handMask.clone(), contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE); // we are cloning here since method will destruct the image

  if (contours.size()) {
    for (int i=0; i<contours.size(); i++) {
      vector<Point> contour = contours[i];
      Mat contourMat = Mat(contour);
      double area = cv::contourArea(contourMat);

      if (area > 3000)  { // possible hand
	center = mean(contourMat);
	Point centerPoint = Point(center.val[0], center.val[1]);

	vector<Point> approxCurve;
	cv::approxPolyDP(contourMat, approxCurve, 20, true);

	vector<int> hull;
	cv::convexHull(Mat(approxCurve), hull);

	// find upper and lower bounds of the hand and define cutoff threshold (don't consider lower vertices as fingers)
	int upper = 640, lower = 0;
	for (int j=0; j<hull.size(); j++) {
	  int idx = hull[j]; // corner index
	  if (approxCurve[idx].y < upper) upper = approxCurve[idx].y;
	  if (approxCurve[idx].y > lower) lower = approxCurve[idx].y;
	}
	float cutoff = lower - (lower - upper) * 0.1f;

	// find interior angles of hull corners
	for (int j=0; j<hull.size(); j++) {
	  int idx = hull[j]; // corner index
	  int pdx = idx == 0 ? approxCurve.size() - 1 : idx - 1; //  predecessor of idx
	  int sdx = idx == approxCurve.size() - 1 ? 0 : idx + 1; // successor of idx

	  Point v1 = approxCurve[sdx] - approxCurve[idx];
	  Point v2 = approxCurve[pdx] - approxCurve[idx];

	  float angle = acos( (v1.x*v2.x + v1.y*v2.y) / (norm(v1) * norm(v2)) );

	  // low interior angle + within upper 90% of region -> we got a finger
	  if (angle < 1 && approxCurve[idx].y < cutoff) {
	    int u = approxCurve[idx].x;
	    int v = approxCurve[idx].y;

	    fingerTips.push_back(Point2i(u,v));
						
	    if (debug) {
	      cv::circle(debugFrame, approxCurve[idx], 10, Scalar(1), -1);
	    }
	  }
	}

	if (debug) {
	  // draw cutoff threshold
	  cv::line(debugFrame, Point(center.val[0]-100, cutoff), Point(center.val[0]+100, cutoff), Scalar(1.0f));

	  // draw approxCurve
	  for (int j=0; j<approxCurve.size(); j++) {
	    cv::circle(debugFrame, approxCurve[j], 10, Scalar(1.0f));
	    if (j != 0) {
	      cv::line(debugFrame, approxCurve[j], approxCurve[j-1], Scalar(1.0f));
	    } else {
	      cv::line(debugFrame, approxCurve[0], approxCurve[approxCurve.size()-1], Scalar(1.0f));
	    }
	  }

	  // draw approxCurve hull
	  for (int j=0; j<hull.size(); j++) {
	    cv::circle(debugFrame, approxCurve[hull[j]], 10, Scalar(1.0f), 3);
	    if(j == 0) {
	      cv::line(debugFrame, approxCurve[hull[j]], approxCurve[hull[hull.size()-1]], Scalar(1.0f));
	    } else {
	      cv::line(debugFrame, approxCurve[hull[j]], approxCurve[hull[j-1]], Scalar(1.0f));
	    }
	  }
	}
      }
    }
  }

  return fingerTips;
}

void depth_cb(freenect_device *dev, void *v_depth, uint32_t timestamp)
{
  int i;
  int first = 0;
  int px = 0 , py = 0;
  int tx = 0 , ty = 0; //counts what row and what column we are in
  int alert = 0;
  uint16_t *depth = (uint16_t*)v_depth;
	
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
  }
  //Ready to pass gl_deapth_back to openCV processing. 1st convert matrix
  fingerTips = detectFingertips();
  pthread_cond_signal(&gl_frame_cond);
  pthread_mutex_unlock(&gl_backbuf_mutex);
}
void unproject(unsigned short* depth, float* x, float* y, float* z) {
  int u,v;
  const float f = 500.0f;
  const float u0 = 320.0f;
  const float v0 = 240.0f;
  float zCurrent;

  // TODO calibration

  for (int i=0; i<640*480; i++) {
    u = i % 640;
    v = i / 640;
    zCurrent = 1.0f / (-0.00307110156374373f * depth[i] + 3.33094951605675f);
    if (z != NULL) {
      z[i] = zCurrent;
    }
    if (x != NULL) {
      x[i] = (u - u0) * zCurrent / f;
    }
    if (y != NULL) {
      y[i] = (v - v0) * zCurrent / f;
    }
  }
}

int mouse(cv::Scalar& center){

  int px = center.val[0];
  int py= center.val[1];
  
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
    hold++;
    printf("\n%d\n", hold);
  } else {
    pusx = mx;
    pusy = my;
    hold = 0;
  }		
			
  if(hold > 15) {
    hold = -30;
    XTestFakeButtonEvent(display, 1, 1, CurrentTime);
    XTestFakeButtonEvent(display, 1, 0, CurrentTime);
  }

  //printf("-- %d x %d -- \n", mx, my);

  XTestFakeMotionEvent(display, -1, tmousex-200, tmousey-200, CurrentTime);
  XSync(display, 0);

  //printf("\n\n %d  -  %d \n\n", mx, my);

}

void rgb_cb(freenect_device *dev, void *rgb, uint32_t timestamp)
{
  pthread_mutex_lock(&gl_backbuf_mutex);
  //got_frames++;
  memcpy(gl_rgb_back, rgb, FREENECT_VIDEO_RGB_SIZE);
  pthread_cond_signal(&gl_frame_cond);
  pthread_mutex_unlock(&gl_backbuf_mutex);
}

void printUsage() {
  printf("\n=====Kinect Mouse=====\n\n"
	 "Synopsis:\n"
	 "\tkmouse [sensitivity (1-32767)]\n"
	 "'W'-Tilt Up\n'S'-Level\n'X'-Tilt Down\n'0'-'6'-LED Mode\n");
}

void *freenect_threadfunc(void *arg) {
  freenect_set_tilt_degs(f_dev,freenect_angle);
  freenect_set_led(f_dev,LED_GREEN);
  freenect_set_depth_callback(f_dev, depth_cb);
  freenect_set_video_callback(f_dev, rgb_cb);
  freenect_set_video_format(f_dev, FREENECT_VIDEO_RGB);
  freenect_set_depth_format(f_dev, FREENECT_DEPTH_11BIT);
	
  while ( (key = cvWaitKey(1)) != 27) { //while escape key is not pressed	
    freenect_raw_tilt_state* state;
    freenect_update_tilt_state(f_dev);
    state = freenect_get_tilt_state(f_dev);;
    double dx,dy,dz;
    freenect_get_mks_accel(state, &dx, &dy, &dz);
    //printf("\r raw acceleration: %4d %4d %4d  mks acceleration: %4f %4f %4f\r", ax, ay, az, dx, dy, dz);
    fflush(stdout);
  }
  printf("\nShutting Down Streams...\n");

  freenect_stop_depth(f_dev);
  freenect_stop_video(f_dev);

  freenect_close_device(f_dev);
  freenect_shutdown(f_ctx);

  printf("-- done!\n");
}

int main(int argc, char **argv) {
  using namespace std;
  using namespace cv;
  //using namespace TUIO;

  //Initializing Mouse Stuff
  printUsage();
  if (argc == 2) {
    snstvty = atoi(argv[1]);
  } else {
    snstvty = 20000;
  }

  //mousemask(ALL_MOUSE_EVENTS, NULL); //What does this do? Where is it?

  display = XOpenDisplay(0);

  root_window = DefaultRootWindow(display);

  screenw = XDisplayWidth(display, SCREEN);
  screenh = XDisplayHeight(display, SCREEN);

  printf("\nDefault Display Found\n");
  printf("\nSize: %dx%d\n", screenw, screenh);

  screenw += 200;
  screenh += 200;

  // Done Initializing Mouse Stuff

  //CLNUICamera cam = CreateNUICamera();

  const float rMin = 25;

  //unsigned short* depthFrameRawData = (unsigned short*) depthFrameRaw.data;

  //	bool tuio3dMode = false;
  //	TuioServer* tuio = new TuioServer(tuio3dMode);
  //	TuioTime time;

  bool debug = true;

  float zMin = 0.0f;
  float zMax = 0.75f;

  if (!freenect_init(&f_ctx, NULL)) {
    printf("freenect_init() failed\n");
    return 1;
  }
  freenect_set_log_level(f_ctx, FREENECT_LOG_DEBUG);//should look into how to read this log
	
  int nr_devices = freenect_num_devices (f_ctx);
  printf ("\nNumber of Devices Found: %d\n", nr_devices);

  if (nr_devices < 1) {
    printf("\nCOULD NOT LOCATE KINECT :(\n");
    return 1;
  }
  int user_device_number = 0;
  if (freenect_open_device(f_ctx, &f_dev, user_device_number) < 0) {
    printf("\nCOULD NOT LOCATE KINECT :(\n");
    return 1;
  }
		
  int res = pthread_create(&freenect_thread, NULL, freenect_threadfunc, NULL);
  if (res) {
    printf("Could Not Create Thread\n");
    return 1;
  }
/* 
    std::vector<cv::Point2i> fingerTips;

    if (debug) {					
      fingerTips = detectFingertips(z, 0, 0.75, debugFrame);
    } else {
      // find fingertips
      Scalar center;
      fingerTips = detectFingertips(z, &center);

      // draw fingetips
      for(vector<Point2i>::iterator it = fingerTips.begin(); it != fingerTips.end(); it++) {
	circle(debugFrame, (*it), 10, Scalar(1.0f), -1);
      }					
    }

    send fingertip positions via TUIO
       time = TuioTime::getSessionTime();
       tuio->initFrame(time);
       for(vector<Point2i>::iterator it = fingerTips.begin(); it != fingerTips.end(); it++) {
       // pixel coordinates
       int u = (int)(*it).x;
       int v = (int)(*it).y;

       float pX = 1.0f - u / 640.0f;
       float pY = v / 480.0f;
       float pZ = (z.at<float>(v,u) - zMin) / (zMax - zMin);

       TUIO::TuioCursor* cursor = tuio->getClosestTuioCursor(pX,pY,pZ);
       if (cursor == NULL || cursor->getDistance(pX,pY,pZ) > 0.05) {
       tuio->addTuioCursor(pX,pY,pZ);						
       } else if(cursor->getTuioTime() != time) {
       tuio->updateTuioCursor(cursor, pX, pY, pZ);
       }
       }				
       tuio->stopUntouchedMovingCursors();				
       tuio->removeUntouchedStoppedCursors();
       tuio->commitFrame();

       cout << tuio->getTuioCursors().size() << endl;
       int mouse();
    */// draw our debugframe
    //imshow("debugFrame", debugFrame); //required?

return 0;

  //StopNUICamera(cam);
}
