cmake_minimum_required (VERSION 3.5)
project(ipc_main)

# set(CMAKE_BUILD_TYPE Debug)

# Create the executable
add_executable(ipc_main main.cpp)

# Link the static library from subproject1 using its alias sub::lib1
# Link the header only library from subproject2 using its alias sub::lib2
# This will cause the include directories for that target to be added to this project

add_subdirectory(cpp-ipc)
target_link_libraries(ipc_main ipc)


# ./ipc_main recv 100
# ./ipc_main send 100 120