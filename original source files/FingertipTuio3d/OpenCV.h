/********************************************************************************
*								Robert Walter - 2010
********************************************************************************/

#pragma once

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

#pragma comment(lib, "cxcore210d.lib")
#pragma comment(lib, "cv210d.lib")
#pragma comment(lib, "highgui210d.lib")

#include <opencv/highgui.h>
#include <opencv/cv.h>

inline std::ostream& operator <<(std::ostream& out, cv::Point2f point) {
	out << point.x << " " << point.y;
	return out;
}

static std::ostream& operator <<(std::ostream& out, cv::Point3f point) {
	out << point.x << " " << point.y << " " << point.z;
	return out;
}

template<class T> inline std::ostream& operator <<(std::ostream& out, std::vector<T> v) {
	for (int i=0; i<v.size(); i++) {
		out << v[i] << std::endl;
	}
	return out;
}

template<class T> inline std::ostream& operator<<(std::ostream& out, const cv::Mat_<T>& mat)
{    
	using namespace std;
	using namespace cv;

	for(int j = 0; j < mat.rows; ++j) {
		for(int i = 0; i < mat.cols; ++i) {
            out << mat(j, i) << '\t';
		}
		out << endl;
	}
    return out;
}

inline cv::Mat matread(const char* fname) {
	using namespace cv;
	using namespace std;

	vector<double> vec; 
    ifstream inFile (fname);
    string line;
    int linenum = 0;

    while (getline (inFile, line))
    {
        linenum++;
        istringstream linestream(line);
        string item;
        int itemnum = 0;
        while (getline (linestream, item, ' '))
        {
			if (!item.empty()) { // ignore empty parts
				double v;
				sscanf(item.c_str(), "%lf", &v);
				// store data do vector
				vec.push_back(v);
				itemnum++;
			}
        }
    }

	// copy vector to (fixed size) matrix
	cv::Mat mat(vec, true); // CV_64F

	// reshape matrix to its original dimension
	return mat.reshape(0, linenum);
}

//// some handy operators for matrix output
//
//std::ostream& operator<<(std::ostream& out, std::vector< std::vector<cv::Point3f> > pts)
//{   
//	using namespace std;
//	using namespace cv;
//
//	for(int i = 0; i < pts.size(); ++i) {
//        out << "view " << i << endl;
//		for(int j = 0; j < pts[i].size(); ++j) {
//			out << '\t' << pts[i][j].x << " " << pts[i][j].y << " " << pts[i][j].z << endl;
//		}
//	}
//	out << endl;
//    return out;
//}
//
//std::ostream& operator<<(std::ostream& out, std::vector< std::vector<cv::Point2f> > pts)
//{    
//	using namespace std;
//	using namespace cv;
//
//	for(int i = 0; i < pts.size(); ++i) {
//        out << "view " << i << endl;
//		for(int j = 0; j < pts[i].size(); ++j) {
//			out << '\t' << pts[i][j].x << " " << pts[i][j].y << endl;
//		}
//	}
//	out << endl;
//    return out;
//}
//
//std::ostream& operator<<(std::ostream& out, std::vector<cv::Point2f> pts)
//{    
//	using namespace std;
//	using namespace cv;
//
//	for(int j = 0; j < pts.size(); ++j) {
//		out << '\t' << pts[j].x << " " << pts[j].y << endl;
//	}
//	out << endl;
//    return out;
//}
//
//template<class T> std::ostream& operator<<(std::ostream& out, const cv::Mat_<T>& mat)
//{    
//	using namespace std;
//	using namespace cv;
//
//	for(int j = 0; j < mat.rows; ++j) {
//		for(int i = 0; i < mat.cols; ++i) {
//            out << mat(j, i) << '\t';
//		}
//		out << endl;
//	}
//    return out;
//}
//
//std::ostream& operator<<(std::ostream& out, std::vector< cv::Mat > mats)
//{    
//	using namespace std;
//	using namespace cv;
//
//	for(int i = 0; i < mats.size(); ++i) {
//        out << "view " << i << endl;
//		out << (Mat_<double>&)mats[i];
//	}
//	out << endl;
//    return out;
//}