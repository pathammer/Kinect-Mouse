#include <ntk/ntk.h>
#include <ntk/camera/calibration.h>
#if defined(USE_PMDSDK) && defined(NESTK_PRIVATE)
# include "pmdsdk2.h"
# include <ntk/private/camera/pmd_grabber.h>
# include <ntk/private/camera/pmd_rgb_grabber.h>
#endif

#include <iostream>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <cstdlib>
#include <sstream>
#include <iomanip>

#include <ntk/camera/opencv_grabber.h>
#include <ntk/camera/file_grabber.h>
#include <ntk/camera/rgbd_frame_recorder.h>
#include <ntk/camera/kinect_grabber.h>

#include <ntk/camera/rgbd_processor.h>
#include <ntk/utils/opencv_utils.h>

// use viewer for GUI and object detection

int debug = 0;

using namespace ntk;
using namespace cv;
using namespace std;

namespace opt {
  ntk::arg<const char*> dir_prefix("--prefix", "Directory prefix for output", "grab1");
  ntk::arg<int> first_index("--istart", "First image index", 0);
  ntk::arg<const char*> calibration_file("--calibration", "Calibration file (yml)", 0);
  ntk::arg<const char*> image("--image", "Fake mode, use given still image", 0);
  ntk::arg<const char*> directory("--directory", "Fake mode, use all view???? images in dir.", 0);
  ntk::arg<int> camera_id("--camera-id", "Camera id for opencv", 0);
  ntk::arg<bool> sync("--sync", "Synchronization mode", 0);
}
class hand {
public:
  hand() {}
  cv::Point center;
  int numFingers;
  int isClicked;
  int isOn;
  hand (cv::Point c) {
     center = c;
  }
  int checkDistance(Point n) {
    int dx = n.x - center.x;
    int dy = n.y - center.y;
    return math::sqrt(dx*dx+dy*dy);
  }
};

std::vector<cv::Point2i> detectFingertips(cv::Mat1f z, float zMin, float zMax, cv::Mat1f debugFrame, hand hand1, hand hand2) {
  
  vector<Point2i> fingerTips;

  Mat handMask = z < zMax & z > zMin;
  debugFrame=handMask;
  std::vector<std::vector<cv::Point> > contours;

  cv::findContours(handMask, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);
  
  hand1.isOn = 1;
  int numHands = 0;

  if (contours.size()) {
    cout << contours.size() << endl;
    for (int i=0; i<contours.size(); i++) {
      vector<Point> contour = contours[i];
      Mat contourMat = Mat(contour);
      double area = cv::contourArea(contourMat);

      if (area > 3000)  { // possible hand
	Scalar center = mean(contourMat);
	Point centerPoint = Point(center.val[0], center.val[1]);
	numHands++;
	if ( i != contours.size()-1) { // if second hand
	  if (!hand2.isOn) {
	    //declare new hand called hand 2
	      hand2.isOn = 1;
	  }
	  hand2.center=centerPoint;
	}
	else {
	  hand1.center=centerPoint;
	  if (numHands == 1)
	    hand2.isOn=0; //turn off hand to
	}
	cout << i<< " # "<< centerPoint.x << "," << centerPoint.y << endl;

	if (numHands ==2) {
	  circle (debugFrame, hand2.center, 10, CV_RGB(0,255,0), 10);
	}
	circle (debugFrame, hand1.center, 10, CV_RGB(255,0,0), 4);





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


int main(int argc, char** argv) {
  arg_base::set_help_option("-h");
  arg_parse(argc, argv);
  ntk_debug_level = 1;
  cv::setBreakOnError(true);
  KinectGrabber * grabber = new KinectGrabber();
  grabber->initialize(); 

  // calibration
  cout << "got here" << endl;
	
  ntk::RGBDCalibration* calib_data = 0;
  if (opt::calibration_file()) {
    calib_data = new RGBDCalibration();
    calib_data->loadFromFile(opt::calibration_file());
  }
  else if (QDir::current().exists("kinect_calibration.yml")) {
	
    ntk_dbg(0) << "[WARNING] Using kinect_calibration.yml in current directory";
    ntk_dbg(0) << "[WARNING] use --calibration to specify a different file.";
	
    calib_data = new RGBDCalibration();
    calib_data->loadFromFile("kinect_calibration.yml");
  }

  if (calib_data) {
    cout << "calibrating" << endl;
    grabber->setCalibrationData(*calib_data);
  }
  
  // Set camera tilt.
  grabber->setTiltAngle(15);
  grabber->start();

  // Postprocess raw kinect data.
  // Tell the processor to transform raw depth into meters using baseline-offset technique.
  RGBDProcessor processor;
  processor.setFilterFlag(RGBDProcessor::ComputeKinectDepthBaseline, true);

  // OpenCV windows.
  //namedWindow("color");
  //namedWindow("depth_as_color");
  //namedWindow("depth");
  namedWindow("depth_normalized");
  namedWindow("fingers");

  // OpenCV variables
  cv::Mat z(480, 640, CV_32FC1); //our matrix to mask with
  Mat1f debugFrame(480, 640); //our frame to paint fingers and circles and lines
  debugFrame = z * 0.1;//??
  hand hand1, hand2;


  // Current image. An RGBDImage stores rgb and depth data.
  RGBDImage current_frame;
  while (true) {
    grabber->waitForNextFrame();
    grabber->copyImageTo(current_frame);
		
    /**
     * This is where the RGB and depth are processed
     * Take a look at RGBDProcessor.cpp to see whats going on
     */
    processor.processImage(current_frame);
		
    // Show the frames per second of the grabber
    //int fps = grabber->frameRate();
    //cv::putText(current_frame.rgbRef(),
    //		cv::format("%d fps", fps),
    //		Point(10,20), 0, 0.5, Scalar(255,0,0,255));
		
		
    // Display the color image
    //imshow("color", current_frame.rgb());

    // Show the depth image as normalized gray scale
    //imshow_normalized("depth", current_frame.depth());

    // Compute color encoded depth.
    //cv::Mat3b depth_as_color;
    //compute_color_encoded_depth(current_frame.depth(), depth_as_color);
    //imshow("depth_as_color", depth_as_color);
		
		
    // get the depth channel and show it	
    Mat1f depth = current_frame.depth();
    //imshow("depth", depth);
		
    // normalize the depth channel and show it
    Mat1b depth_normalized;
    normalize(depth, depth_normalized, 0, 255, NORM_MINMAX, 0);
    imshow("depth_normalized", depth_normalized);

    // failed attempt at thresholding
    //Mat1f thresh;
    //threshold(depth, thresh, 2, 2, THRESH_TOZERO);
    //imshow("thresh", thresh);
		
    /*
      for (int i = 0; i < d.rows; i++) {
      for (int j = 0;j < d.cols; j++) {
      if (d.at<float>(i, j) > 10) {
      cout << d.at<float>(i, j) << " ";
      }
      }
      cout << endl;
      }
    */
    //cout << endl << endl;

    // OpenCV Magic
    std::vector<cv::Point2i> fingerTips; //our fingertips output info
    fingerTips = detectFingertips(depth_normalized, 1, 35, debugFrame, hand1, hand2);
    // draw fingetips
    for(vector<Point2i>::iterator it = fingerTips.begin(); it != fingerTips.end(); it++) {
      circle(debugFrame, (*it), 10, Scalar(1.0f), -1);
    }
    imshow("fingers", debugFrame);
    //debugFrame=cv::Mat::zeros(480,640,CV_32F);
    //NOTE THAT DEBUG FRAME IS NEVER SHOWN

    // Enable switching to InfraRead mode.
    unsigned char c = cv::waitKey(10) & 0xff;
    if (c == 'q' || c == 27)
      exit(0);
  }

  return 0;
}
