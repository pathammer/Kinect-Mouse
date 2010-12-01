cmake_minimum_required(VERSION 2.8)

add_executable(kmouse kinect_mouse.c)

find_package(Threads REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
include_directories(${OPENGL_INCLUDE_DIRS} ${GLUT_INCLUDE_DIRS} ${USB_INCLUDE_DIRS})
target_link_libraries(kmouse freenect X11 Xtst ncurses ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} m)

install (TARGETS kmouse
  DESTINATION bin)
