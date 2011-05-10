# Install script for directory: /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  FILE(INSTALL DESTINATION "/usr/local/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/AdolcForward"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/BVH"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/MoreVectorization"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/AutoDiff"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/AlignedVector3"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/Polynomials"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/CholmodSupport"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/FFT"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/SparseExtra"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/SuperLUSupport"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/UmfPackSupport"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/NumericalDiff"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/Skyline"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/unsupported/Eigen/MPRealSupport"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/eigen/unsupported/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

