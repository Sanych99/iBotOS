# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alex/iBotOS/testLib/tinch_pp-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/iBotOS/testLib/tinch_pp-master/build

# Include any dependencies generated for this target.
include test/CMakeFiles/net_kernel_sim.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/net_kernel_sim.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/net_kernel_sim.dir/flags.make

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o: test/CMakeFiles/net_kernel_sim.dir/flags.make
test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o: ../test/net_kernel_sim.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/iBotOS/testLib/tinch_pp-master/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o"
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o -c /home/alex/iBotOS/testLib/tinch_pp-master/test/net_kernel_sim.cpp

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.i"
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/iBotOS/testLib/tinch_pp-master/test/net_kernel_sim.cpp > CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.i

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.s"
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/iBotOS/testLib/tinch_pp-master/test/net_kernel_sim.cpp -o CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.s

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.requires:
.PHONY : test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.requires

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.provides: test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/net_kernel_sim.dir/build.make test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.provides.build
.PHONY : test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.provides

test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.provides.build: test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o

# Object files for target net_kernel_sim
net_kernel_sim_OBJECTS = \
"CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o"

# External object files for target net_kernel_sim
net_kernel_sim_EXTERNAL_OBJECTS =

test/net_kernel_sim: test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o
test/net_kernel_sim: test/CMakeFiles/net_kernel_sim.dir/build.make
test/net_kernel_sim: impl/libtinch++.a
test/net_kernel_sim: /usr/lib/x86_64-linux-gnu/libboost_thread.so
test/net_kernel_sim: /usr/lib/x86_64-linux-gnu/libboost_system.so
test/net_kernel_sim: /usr/lib/x86_64-linux-gnu/libboost_regex.so
test/net_kernel_sim: /usr/lib/x86_64-linux-gnu/libboost_signals.so
test/net_kernel_sim: /usr/lib/x86_64-linux-gnu/libpthread.so
test/net_kernel_sim: test/CMakeFiles/net_kernel_sim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable net_kernel_sim"
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/net_kernel_sim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/net_kernel_sim.dir/build: test/net_kernel_sim
.PHONY : test/CMakeFiles/net_kernel_sim.dir/build

test/CMakeFiles/net_kernel_sim.dir/requires: test/CMakeFiles/net_kernel_sim.dir/net_kernel_sim.cpp.o.requires
.PHONY : test/CMakeFiles/net_kernel_sim.dir/requires

test/CMakeFiles/net_kernel_sim.dir/clean:
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build/test && $(CMAKE_COMMAND) -P CMakeFiles/net_kernel_sim.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/net_kernel_sim.dir/clean

test/CMakeFiles/net_kernel_sim.dir/depend:
	cd /home/alex/iBotOS/testLib/tinch_pp-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/iBotOS/testLib/tinch_pp-master /home/alex/iBotOS/testLib/tinch_pp-master/test /home/alex/iBotOS/testLib/tinch_pp-master/build /home/alex/iBotOS/testLib/tinch_pp-master/build/test /home/alex/iBotOS/testLib/tinch_pp-master/build/test/CMakeFiles/net_kernel_sim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/net_kernel_sim.dir/depend
