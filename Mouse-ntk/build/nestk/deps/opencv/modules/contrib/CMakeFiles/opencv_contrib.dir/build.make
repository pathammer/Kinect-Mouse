# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build

# Include any dependencies generated for this target.
include nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/depend.make

# Include the progress variables for this target.
include nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/progress.make

# Include the compile flags for this target's objects.
include nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o: ../nestk/deps/opencv/modules/contrib/src/chamfermatching.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/chamfermatching.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/chamfermatching.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/chamfermatching.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/chamfermatching.cpp > CMakeFiles/opencv_contrib.dir/src/chamfermatching.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/chamfermatching.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/chamfermatching.cpp -o CMakeFiles/opencv_contrib.dir/src/chamfermatching.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o: ../nestk/deps/opencv/modules/contrib/src/selfsimilarity.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/selfsimilarity.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/selfsimilarity.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/selfsimilarity.cpp > CMakeFiles/opencv_contrib.dir/src/selfsimilarity.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/selfsimilarity.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/selfsimilarity.cpp -o CMakeFiles/opencv_contrib.dir/src/selfsimilarity.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o: ../nestk/deps/opencv/modules/contrib/src/spinimages.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/spinimages.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/spinimages.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/spinimages.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/spinimages.cpp > CMakeFiles/opencv_contrib.dir/src/spinimages.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/spinimages.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/spinimages.cpp -o CMakeFiles/opencv_contrib.dir/src/spinimages.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o: ../nestk/deps/opencv/modules/contrib/src/precomp.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/precomp.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/precomp.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/precomp.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/precomp.cpp > CMakeFiles/opencv_contrib.dir/src/precomp.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/precomp.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/precomp.cpp -o CMakeFiles/opencv_contrib.dir/src/precomp.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o: ../nestk/deps/opencv/modules/contrib/src/ba.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/ba.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/ba.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/ba.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/ba.cpp > CMakeFiles/opencv_contrib.dir/src/ba.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/ba.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/ba.cpp -o CMakeFiles/opencv_contrib.dir/src/ba.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o: ../nestk/deps/opencv/modules/contrib/src/adaptiveskindetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/adaptiveskindetector.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/adaptiveskindetector.cpp > CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/adaptiveskindetector.cpp -o CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o: ../nestk/deps/opencv/modules/contrib/src/fuzzymeanshifttracker.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/fuzzymeanshifttracker.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/fuzzymeanshifttracker.cpp > CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/fuzzymeanshifttracker.cpp -o CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o: ../nestk/deps/opencv/modules/contrib/src/octree.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/octree.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/octree.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/octree.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/octree.cpp > CMakeFiles/opencv_contrib.dir/src/octree.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/octree.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/octree.cpp -o CMakeFiles/opencv_contrib.dir/src/octree.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.provides.build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/flags.make
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o: ../nestk/deps/opencv/modules/contrib/src/quadsubpix.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencv_contrib.dir/src/quadsubpix.o -c /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/quadsubpix.cpp

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_contrib.dir/src/quadsubpix.i"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/quadsubpix.cpp > CMakeFiles/opencv_contrib.dir/src/quadsubpix.i

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_contrib.dir/src/quadsubpix.s"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib/src/quadsubpix.cpp -o CMakeFiles/opencv_contrib.dir/src/quadsubpix.s

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.requires:
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.provides: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.requires
	$(MAKE) -f nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.provides.build
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.provides

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.provides.build: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.provides.build

# Object files for target opencv_contrib
opencv_contrib_OBJECTS = \
"CMakeFiles/opencv_contrib.dir/src/chamfermatching.o" \
"CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o" \
"CMakeFiles/opencv_contrib.dir/src/spinimages.o" \
"CMakeFiles/opencv_contrib.dir/src/precomp.o" \
"CMakeFiles/opencv_contrib.dir/src/ba.o" \
"CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o" \
"CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o" \
"CMakeFiles/opencv_contrib.dir/src/octree.o" \
"CMakeFiles/opencv_contrib.dir/src/quadsubpix.o"

# External object files for target opencv_contrib
opencv_contrib_EXTERNAL_OBJECTS =

lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o
lib/libopencv_contrib.so.2.2.0: lib/libopencv_core.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_imgproc.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_calib3d.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_features2d.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_highgui.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_ml.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_video.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_objdetect.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_flann.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_calib3d.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_highgui.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_imgproc.so.2.2.0
lib/libopencv_contrib.so.2.2.0: lib/libopencv_core.so.2.2.0
lib/libopencv_contrib.so.2.2.0: 3rdparty/lib/libopencv_lapack.a
lib/libopencv_contrib.so.2.2.0: 3rdparty/lib/libzlib.a
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build.make
lib/libopencv_contrib.so.2.2.0: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../../../lib/libopencv_contrib.so"
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencv_contrib.dir/link.txt --verbose=$(VERBOSE)
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../../../lib/libopencv_contrib.so.2.2.0 ../../../../../lib/libopencv_contrib.so.2.2 ../../../../../lib/libopencv_contrib.so

lib/libopencv_contrib.so.2.2: lib/libopencv_contrib.so.2.2.0

lib/libopencv_contrib.so: lib/libopencv_contrib.so.2.2.0

# Rule to build all files generated by this target.
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build: lib/libopencv_contrib.so
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/build

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/chamfermatching.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/selfsimilarity.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/spinimages.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/precomp.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/ba.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/adaptiveskindetector.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/fuzzymeanshifttracker.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/octree.o.requires
nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires: nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/src/quadsubpix.o.requires
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/requires

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/clean:
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib && $(CMAKE_COMMAND) -P CMakeFiles/opencv_contrib.dir/cmake_clean.cmake
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/clean

nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/depend:
	cd /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/nestk/deps/opencv/modules/contrib /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib /home/gcamilo/kmouse/Kinect-Mouse/Mouse-ntk/build/nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : nestk/deps/opencv/modules/contrib/CMakeFiles/opencv_contrib.dir/depend

