#include <iostream>

// tuio
#include "TuioServer.h"

// opencv
#pragma comment(lib, "cxcore210d.lib")
#pragma comment(lib, "cv210d.lib")
#pragma comment(lib, "highgui210d.lib")
#include <opencv/highgui.h>
#include <opencv/cv.h>

// kinect
#include <CLNUIDevice.h>
#pragma comment(lib, "CLNUIDevice.lib")

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

std::vector<cv::Point2i> detectFingertips(cv::Mat1f z, float zMin = 0.0f, float zMax = 0.75f, cv::Mat1f& debugFrame = cv::Mat1f()) {
	using namespace cv;
	using namespace std;
	bool debug = !debugFrame.empty();

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
				Scalar center = mean(contourMat);
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

void main() {
	using namespace std;
	using namespace cv;
	using namespace TUIO;

	cv::Mat depthFrameRaw(480, 640, CV_16UC1);
	cv::Mat x(480, 640, CV_32FC1);
	cv::Mat y(480, 640, CV_32FC1);
	cv::Mat z(480, 640, CV_32FC1);

	Mat1f debugFrame(480, 640);

	CLNUICamera cam = CreateNUICamera();

	const float rMin = 25;

	stringstream buffer;

	unsigned short* depthFrameRawData = (unsigned short*) depthFrameRaw.data;
	int key;

	bool tuio3dMode = false;
	TuioServer* tuio = new TuioServer(tuio3dMode);
	TuioTime time;

	bool debug = true;

	float zMin = 0.0f;
	float zMax = 0.75f;

	if ( StartNUICamera(cam) ) {
		cout << "cam started" << endl;
		while ( (key = cvWaitKey(1)) != 27) {
			if ( GetNUICameraDepthFrameRAW(cam, (PUSHORT)depthFrameRaw.data) ) {
				unproject(depthFrameRawData, (float*)x.data, (float*)y.data, (float*)z.data);
				debugFrame = z * 0.1; 

				if (key == 32) {
					debug = !debug;
				}

				std::vector<cv::Point2i> fingerTips;

				if (debug) {					
					fingerTips = detectFingertips(z, 0, 0.75, debugFrame);
				} else {
					// find fingertips
					fingerTips = detectFingertips(z);

					// draw fingetips
					for(vector<Point2i>::iterator it = fingerTips.begin(); it != fingerTips.end(); it++) {
						circle(debugFrame, (*it), 10, Scalar(1.0f), -1);
					}					
				}

				// send fingertip positions via TUIO
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
				
				// draw our debugframe
				imshow("debugFrame", debugFrame);
			}
		}
	} else {
		cout << "could not start cam" << endl;
	}

	StopNUICamera(cam);
}