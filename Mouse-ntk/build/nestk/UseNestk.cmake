INCLUDE_DIRECTORIES("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk")
INCLUDE_DIRECTORIES("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk")

SET(NESTK_EXTRA_CMAKE_CXX_FLAGS  -Wall -W -Wno-unused -Wno-sign-compare
    CACHE STRING "Extra flags appended to CMAKE_CXX_FLAGS" )
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -W -Wno-unused -Wno-sign-compare" )

INCLUDE("/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/cmake/UseNestkDeps.cmake")

IF(IS_DIRECTORY "/home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/ntk/private")
  ADD_DEFINITIONS(-DNESTK_PRIVATE)
  SET(HAVE_NESTK_PRIVATE 1 CACHE INTERNAL "Nestk private features are available")
ENDIF()
