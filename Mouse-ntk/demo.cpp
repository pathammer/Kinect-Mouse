#include <ntk/ntk.h>
#include <ntk/camera/calibration.h>
#if defined(USE_PMDSDK) && defined(NESTK_PRIVATE)
# include "pmdsdk2.h"
# include <ntk/private/camera/pmd_grabber.h>
# include <ntk/private/camera/pmd_rgb_grabber.h>
#endif

#include <iostream>
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


using namespace ntk;
using namespace cv;

namespace opt {
  ntk::arg<const char*> dir_prefix("--prefix", "Directory prefix for output", "grab1");
  ntk::arg<int> first_index("--istart", "First image index", 0);
  ntk::arg<const char*> calibration_file("--calibration", "Calibration file (yml)", 0);
  ntk::arg<const char*> image("--image", "Fake mode, use given still image", 0);
  ntk::arg<const char*> directory("--directory", "Fake mode, use all view???? images in dir.", 0);
  ntk::arg<int> camera_id("--camera-id", "Camera id for opencv", 0);
  ntk::arg<bool> sync("--sync", "Synchronization mode", 0);
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
	namedWindow("color");
	namedWindow("depth_as_color");
	namedWindow("depth");
	namedWindow("depth_normalized");
	namedWindow("thresh");

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
		int fps = grabber->frameRate();
		cv::putText(current_frame.rgbRef(),
			    cv::format("%d fps", fps),
			    Point(10,20), 0, 0.5, Scalar(255,0,0,255));
		
		
		// Display the color image
		imshow("color", current_frame.rgb());

		// Show the depth image as normalized gray scale
		//imshow_normalized("depth", current_frame.depth());

		// Compute color encoded depth.
		cv::Mat3b depth_as_color;
		compute_color_encoded_depth(current_frame.depth(), depth_as_color);
		imshow("depth_as_color", depth_as_color);
		
		
		// get the depth channel and show it	
		Mat1f depth = current_frame.depth();
		imshow("depth", depth);
		
		// normalize the depth channel and show it
		Mat1b depth_normalized;
  		normalize(depth, depth_normalized, 0, 255, NORM_MINMAX, 0);
    		imshow("depth_normalized", depth_normalized);

		// failed attempt at thresholding
		Mat1f thresh;
		threshold(depth, thresh, 2, 2, THRESH_TOZERO);
    		imshow("thresh", thresh);
		
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
		
		// Enable switching to InfraRead mode.
		unsigned char c = cv::waitKey(10) & 0xff;
		if (c == 'q')
			exit(0);
	}

	return 0;
}
