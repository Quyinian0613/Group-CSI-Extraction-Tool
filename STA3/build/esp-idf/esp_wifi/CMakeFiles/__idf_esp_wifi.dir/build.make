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
CMAKE_SOURCE_DIR = /home/pml/esp/Multi/Multi/STA3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pml/esp/Multi/Multi/STA3/build

# Include any dependencies generated for this target.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend.make

# Include the progress variables for this target.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/coexist.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/coexist.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/coexist.c > CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/coexist.c -o CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/lib_printf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/lib_printf.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/lib_printf.c > CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/lib_printf.c -o CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/mesh_event.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/mesh_event.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/mesh_event.c > CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/mesh_event.c -o CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/phy_init.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/phy_init.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/phy_init.c > CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/phy_init.c -o CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig.c > CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig.c -o CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig_ack.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig_ack.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig_ack.c > CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/smartconfig_ack.c -o CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_init.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_init.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_init.c > CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_init.c -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_default.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_default.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_default.c > CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_default.c -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_netif.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_netif.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_netif.c > CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/src/wifi_netif.c -o CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj: /home/pml/esp/esp-idf/components/esp_wifi/esp32/esp_adapter.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj   -c /home/pml/esp/esp-idf/components/esp_wifi/esp32/esp_adapter.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.i"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pml/esp/esp-idf/components/esp_wifi/esp32/esp_adapter.c > CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.s"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && /home/pml/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pml/esp/esp-idf/components/esp_wifi/esp32/esp_adapter.c -o CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.s

# Object files for target __idf_esp_wifi
__idf_esp_wifi_OBJECTS = \
"CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj"

# External object files for target __idf_esp_wifi
__idf_esp_wifi_EXTERNAL_OBJECTS =

esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/coexist.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/lib_printf.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/phy_init.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32/esp_adapter.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build.make
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pml/esp/Multi/Multi/STA3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX static library libesp_wifi.a"
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_wifi.dir/cmake_clean_target.cmake
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_esp_wifi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build: esp-idf/esp_wifi/libesp_wifi.a

.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/clean:
	cd /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_wifi.dir/cmake_clean.cmake
.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/clean

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend:
	cd /home/pml/esp/Multi/Multi/STA3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pml/esp/Multi/Multi/STA3 /home/pml/esp/esp-idf/components/esp_wifi /home/pml/esp/Multi/Multi/STA3/build /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi /home/pml/esp/Multi/Multi/STA3/build/esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend

