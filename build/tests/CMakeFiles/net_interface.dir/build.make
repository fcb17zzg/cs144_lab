# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/cmake/bin/cmake

# The command to remove a file.
RM = /usr/local/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/lab/sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/lab/sponge/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/net_interface.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/net_interface.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/net_interface.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/net_interface.dir/flags.make

tests/CMakeFiles/net_interface.dir/net_interface.cc.o: tests/CMakeFiles/net_interface.dir/flags.make
tests/CMakeFiles/net_interface.dir/net_interface.cc.o: /root/lab/sponge/tests/net_interface.cc
tests/CMakeFiles/net_interface.dir/net_interface.cc.o: tests/CMakeFiles/net_interface.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/lab/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/net_interface.dir/net_interface.cc.o"
	cd /root/lab/sponge/build/tests && /opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/net_interface.dir/net_interface.cc.o -MF CMakeFiles/net_interface.dir/net_interface.cc.o.d -o CMakeFiles/net_interface.dir/net_interface.cc.o -c /root/lab/sponge/tests/net_interface.cc

tests/CMakeFiles/net_interface.dir/net_interface.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/net_interface.dir/net_interface.cc.i"
	cd /root/lab/sponge/build/tests && /opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/lab/sponge/tests/net_interface.cc > CMakeFiles/net_interface.dir/net_interface.cc.i

tests/CMakeFiles/net_interface.dir/net_interface.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/net_interface.dir/net_interface.cc.s"
	cd /root/lab/sponge/build/tests && /opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/lab/sponge/tests/net_interface.cc -o CMakeFiles/net_interface.dir/net_interface.cc.s

# Object files for target net_interface
net_interface_OBJECTS = \
"CMakeFiles/net_interface.dir/net_interface.cc.o"

# External object files for target net_interface
net_interface_EXTERNAL_OBJECTS =

tests/net_interface: tests/CMakeFiles/net_interface.dir/net_interface.cc.o
tests/net_interface: tests/CMakeFiles/net_interface.dir/build.make
tests/net_interface: tests/libspongechecks.a
tests/net_interface: libsponge/libsponge.a
tests/net_interface: tests/CMakeFiles/net_interface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/root/lab/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable net_interface"
	cd /root/lab/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/net_interface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/net_interface.dir/build: tests/net_interface
.PHONY : tests/CMakeFiles/net_interface.dir/build

tests/CMakeFiles/net_interface.dir/clean:
	cd /root/lab/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/net_interface.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/net_interface.dir/clean

tests/CMakeFiles/net_interface.dir/depend:
	cd /root/lab/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/lab/sponge /root/lab/sponge/tests /root/lab/sponge/build /root/lab/sponge/build/tests /root/lab/sponge/build/tests/CMakeFiles/net_interface.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/net_interface.dir/depend

