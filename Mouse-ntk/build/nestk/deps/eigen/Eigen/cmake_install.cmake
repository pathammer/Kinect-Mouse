# Install script for directory: /home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen

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
  FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen" TYPE FILE FILES
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Geometry"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/QtAlignedMalloc"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Householder"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Core"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Sparse"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Eigenvalues"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/StdDeque"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/LU"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/StdVector"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Eigen2Support"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/QR"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Eigen"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/StdList"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/SVD"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Dense"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Array"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Cholesky"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/Jacobi"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

