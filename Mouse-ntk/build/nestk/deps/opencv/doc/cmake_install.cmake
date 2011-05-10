# Install script for directory: /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv/doc" TYPE FILE FILES
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/haartraining.htm"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/packaging.txt"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/CMakeLists.txt"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/license.txt"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/README.txt"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/opencv.jpg"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/opencv-logo2.png"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/opencv-logo.png"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/opencv.pdf"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/opencv_cheatsheet.pdf"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/pattern.pdf"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv/doc/papers" TYPE FILE FILES
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/papers/camshift.pdf"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/papers/algo_tracking.pdf"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/papers/avbpa99.ps"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv/doc/vidsurv" TYPE FILE FILES
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/vidsurv/Blob_Tracking_Modules.doc"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/vidsurv/TestSeq.doc"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/doc/vidsurv/Blob_Tracking_Tests.doc"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

