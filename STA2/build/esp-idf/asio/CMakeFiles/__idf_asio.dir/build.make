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
CMAKE_SOURCE_DIR = /home/pml/esp/Multi/Multi/STA2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pml/esp/Multi/Multi/STA2/build

# Include any dependencies generated for this target.
include esp-idf/asio/CMakeFiles/__idf_asio.dir/depend.make

# Include the progress variables for this target.
include esp-idf/asio/CMakeFiles/__idf_asio.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/asio/CMakeFiles/__idf_asio.dir/flags.make

esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj: esp-idf/asio/CMakeFiles/__idf_asio.dir/flags.make
esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj: /home/pml/esp/esp-idf/components/asio/asio/asio/src/asio.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj"
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj -c /home/pml/esp/esp-idf/components/asio/asio/asio/src/asio.cpp

esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.i"
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pml/esp/esp-idf/components/asio/asio/asio/src/asio.cpp > CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.i

esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.s"
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pml/esp/esp-idf/components/asio/asio/asio/src/asio.cpp -o CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.s

# Object files for target __idf_asio
__idf_asio_OBJECTS = \
"CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj"

# External object files for target __idf_asio
__idf_asio_EXTERNAL_OBJECTS =

esp-idf/asio/libasio.a: esp-idf/asio/CMakeFiles/__idf_asio.dir/asio/asio/src/asio.cpp.obj
esp-idf/asio/libasio.a: esp-idf/asio/CMakeFiles/__idf_asio.dir/build.make
esp-idf/asio/libasio.a: esp-idf/asio/CMakeFiles/__idf_asio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pml/esp/Multi/Multi/STA2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libasio.a"
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && $(CMAKE_COMMAND) -P CMakeFiles/__idf_asio.dir/cmake_clean_target.cmake
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_asio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/asio/CMakeFiles/__idf_asio.dir/build: esp-idf/asio/libasio.a

.PHONY : esp-idf/asio/CMakeFiles/__idf_asio.dir/build

esp-idf/asio/CMakeFiles/__idf_asio.dir/clean:
	cd /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio && $(CMAKE_COMMAND) -P CMakeFiles/__idf_asio.dir/cmake_clean.cmake
.PHONY : esp-idf/asio/CMakeFiles/__idf_asio.dir/clean

esp-idf/asio/CMakeFiles/__idf_asio.dir/depend:
	cd /home/pml/esp/Multi/Multi/STA2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pml/esp/Multi/Multi/STA2 /home/pml/esp/esp-idf/components/asio /home/pml/esp/Multi/Multi/STA2/build /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio /home/pml/esp/Multi/Multi/STA2/build/esp-idf/asio/CMakeFiles/__idf_asio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/asio/CMakeFiles/__idf_asio.dir/depend

