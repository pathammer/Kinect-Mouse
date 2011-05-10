# Install script for directory: /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core

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
  FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Core" TYPE FILE FILES
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryOp.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/ProductBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/CwiseNullaryOp.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/NestByValue.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Replicate.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Random.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/ReturnByValue.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Visitor.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Select.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Block.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/BandMatrix.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/DiagonalProduct.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/MapBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/TriangularMatrix.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Redux.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Dot.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/BooleanRedux.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Map.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/GlobalFunctions.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/DenseCoeffsBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/SolveTriangular.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/DenseStorageBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/SelfCwiseBinaryOp.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/VectorBlock.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Matrix.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/PermutationMatrix.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/ForceAlignedAccess.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/ArrayWrapper.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Fuzzy.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/GenericPacketMath.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/ArrayBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/MathFunctions.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Product.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/CwiseBinaryOp.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/VectorwiseOp.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Reverse.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/SelfAdjointView.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/DiagonalMatrix.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/CommaInitializer.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Stride.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/NumTraits.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Swap.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/NoAlias.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Array.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Functors.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryView.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/EigenBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Assign.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/MatrixBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Transpose.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/DenseBase.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Flagged.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Transpositions.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/MatrixStorage.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/StableNorm.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/IO.h"
    "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/eigen/Eigen/src/Core/Diagonal.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/eigen/Eigen/src/Core/products/cmake_install.cmake")
  INCLUDE("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/eigen/Eigen/src/Core/util/cmake_install.cmake")
  INCLUDE("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/eigen/Eigen/src/Core/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

