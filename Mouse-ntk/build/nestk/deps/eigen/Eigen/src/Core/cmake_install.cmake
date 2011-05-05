# Install script for directory: /home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core

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
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Reverse.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/DiagonalMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Block.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Fuzzy.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/MatrixBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/DiagonalProduct.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/IO.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/MatrixStorage.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Diagonal.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Matrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/BooleanRedux.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Transpose.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Select.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Assign.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/StableNorm.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Replicate.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/VectorwiseOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryView.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/ArrayWrapper.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/NestByValue.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Swap.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/DenseBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Flagged.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/MapBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Visitor.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Dot.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/ForceAlignedAccess.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/GenericPacketMath.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/EigenBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Array.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Functors.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/CommaInitializer.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/NumTraits.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/VectorBlock.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/DenseCoeffsBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/BandMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/GlobalFunctions.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/CwiseNullaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/TriangularMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/PermutationMatrix.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Product.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/CwiseBinaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Random.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/NoAlias.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/MathFunctions.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/DenseStorageBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/SelfCwiseBinaryOp.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Redux.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/ArrayBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/ProductBase.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/SolveTriangular.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/SelfAdjointView.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Stride.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Map.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/ReturnByValue.h"
    "/home/louis/Documents/Motion Capture/Mouse/nestk/deps/eigen/Eigen/src/Core/Transpositions.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Core/products/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Core/util/cmake_install.cmake")
  INCLUDE("/home/louis/Documents/Motion Capture/Mouse/build/nestk/deps/eigen/Eigen/src/Core/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

