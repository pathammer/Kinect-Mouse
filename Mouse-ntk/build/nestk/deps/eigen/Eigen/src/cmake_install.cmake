# Install script for directory: /home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src

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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Geometry/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Householder/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Core/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/misc/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Sparse/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Eigenvalues/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/StlSupport/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/LU/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Eigen2Support/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/QR/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/plugins/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/SVD/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Cholesky/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Jacobi/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

