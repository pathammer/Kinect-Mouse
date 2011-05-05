cmake_minimum_required(VERSION 2.6)

PROJECT(demo)

ADD_SUBDIRECTORY(nestk)
## nestk/UseNestk.cmake.in defines variable to use nestk.
## It itself includes nestk/deps/cmake/UseEmbeddedNestkDeps.cmake that
## contains most of the cmake find packages commands.
INCLUDE("${nestk_BINARY_DIR}/UseNestk.cmake")

ADD_EXECUTABLE(demo demo.cpp)
TARGET_LINK_LIBRARIES(demo nestk)
