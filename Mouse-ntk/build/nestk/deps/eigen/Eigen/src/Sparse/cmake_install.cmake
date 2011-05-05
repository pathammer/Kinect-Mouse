# Install script for directory: /home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse

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
  FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Sparse" TYPE FILE FILES
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseUtil.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/DynamicSparseMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/MappedSparseMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseTranspose.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseBlock.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseSparseProduct.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseView.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/CompressedStorage.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseFuzzy.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseCwiseUnaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/AmbiVector.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseProduct.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseDot.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseVector.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseSelfAdjointView.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseMatrixBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseTriangularView.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseDenseProduct.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseRedux.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/TriangularSolver.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseCwiseBinaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/CoreIterators.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseDiagonalProduct.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Sparse/SparseAssign.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

