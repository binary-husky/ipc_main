# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/hmp/learn_cmake/ipc_main/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hmp/learn_cmake/ipc_main/src/build

# Include any dependencies generated for this target.
include cpp-ipc/src/CMakeFiles/ipc.dir/depend.make

# Include the progress variables for this target.
include cpp-ipc/src/CMakeFiles/ipc.dir/progress.make

# Include the compile flags for this target's objects.
include cpp-ipc/src/CMakeFiles/ipc.dir/flags.make

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.o: ../cpp-ipc/src/libipc/buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/buffer.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/buffer.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/buffer.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/buffer.cpp > CMakeFiles/ipc.dir/libipc/buffer.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/buffer.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/buffer.cpp -o CMakeFiles/ipc.dir/libipc/buffer.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.o: ../cpp-ipc/src/libipc/ipc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/ipc.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/ipc.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/ipc.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/ipc.cpp > CMakeFiles/ipc.dir/libipc/ipc.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/ipc.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/ipc.cpp -o CMakeFiles/ipc.dir/libipc/ipc.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o: ../cpp-ipc/src/libipc/pool_alloc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/pool_alloc.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/pool_alloc.cpp > CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/pool_alloc.cpp -o CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.o: ../cpp-ipc/src/libipc/shm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/shm.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/shm.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/shm.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/shm.cpp > CMakeFiles/ipc.dir/libipc/shm.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/shm.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/shm.cpp -o CMakeFiles/ipc.dir/libipc/shm.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o: ../cpp-ipc/src/libipc/sync/condition.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/condition.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/sync/condition.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/condition.cpp > CMakeFiles/ipc.dir/libipc/sync/condition.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/sync/condition.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/condition.cpp -o CMakeFiles/ipc.dir/libipc/sync/condition.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o: ../cpp-ipc/src/libipc/sync/mutex.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/mutex.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/mutex.cpp > CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/mutex.cpp -o CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o: ../cpp-ipc/src/libipc/sync/semaphore.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/semaphore.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/semaphore.cpp > CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/semaphore.cpp -o CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o: ../cpp-ipc/src/libipc/sync/waiter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/waiter.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/waiter.cpp > CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/sync/waiter.cpp -o CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.o: ../cpp-ipc/src/libipc/platform/platform.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ipc.dir/libipc/platform/platform.c.o   -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.c

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ipc.dir/libipc/platform/platform.c.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.c > CMakeFiles/ipc.dir/libipc/platform/platform.c.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ipc.dir/libipc/platform/platform.c.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.c -o CMakeFiles/ipc.dir/libipc/platform/platform.c.s

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o: cpp-ipc/src/CMakeFiles/ipc.dir/flags.make
cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o: ../cpp-ipc/src/libipc/platform/platform.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o -c /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.cpp

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipc.dir/libipc/platform/platform.cpp.i"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.cpp > CMakeFiles/ipc.dir/libipc/platform/platform.cpp.i

cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipc.dir/libipc/platform/platform.cpp.s"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src/libipc/platform/platform.cpp -o CMakeFiles/ipc.dir/libipc/platform/platform.cpp.s

# Object files for target ipc
ipc_OBJECTS = \
"CMakeFiles/ipc.dir/libipc/buffer.cpp.o" \
"CMakeFiles/ipc.dir/libipc/ipc.cpp.o" \
"CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o" \
"CMakeFiles/ipc.dir/libipc/shm.cpp.o" \
"CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o" \
"CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o" \
"CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o" \
"CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o" \
"CMakeFiles/ipc.dir/libipc/platform/platform.c.o" \
"CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o"

# External object files for target ipc
ipc_EXTERNAL_OBJECTS =

lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/buffer.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/ipc.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/pool_alloc.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/shm.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/condition.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/mutex.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/semaphore.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/sync/waiter.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.c.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/libipc/platform/platform.cpp.o
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/build.make
lib/libipc.a: cpp-ipc/src/CMakeFiles/ipc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hmp/learn_cmake/ipc_main/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX static library ../../lib/libipc.a"
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && $(CMAKE_COMMAND) -P CMakeFiles/ipc.dir/cmake_clean_target.cmake
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ipc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cpp-ipc/src/CMakeFiles/ipc.dir/build: lib/libipc.a

.PHONY : cpp-ipc/src/CMakeFiles/ipc.dir/build

cpp-ipc/src/CMakeFiles/ipc.dir/clean:
	cd /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src && $(CMAKE_COMMAND) -P CMakeFiles/ipc.dir/cmake_clean.cmake
.PHONY : cpp-ipc/src/CMakeFiles/ipc.dir/clean

cpp-ipc/src/CMakeFiles/ipc.dir/depend:
	cd /home/hmp/learn_cmake/ipc_main/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hmp/learn_cmake/ipc_main/src /home/hmp/learn_cmake/ipc_main/src/cpp-ipc/src /home/hmp/learn_cmake/ipc_main/src/build /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src /home/hmp/learn_cmake/ipc_main/src/build/cpp-ipc/src/CMakeFiles/ipc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cpp-ipc/src/CMakeFiles/ipc.dir/depend

