# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "atrv_tv: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iatrv_tv:/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(atrv_tv_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg" NAME_WE)
add_custom_target(_atrv_tv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "atrv_tv" "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg" NAME_WE)
add_custom_target(_atrv_tv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "atrv_tv" "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg" "std_msgs/Header:sensor_msgs/Range"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/atrv_tv
)
_generate_msg_cpp(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Range.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/atrv_tv
)

### Generating Services

### Generating Module File
_generate_module_cpp(atrv_tv
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/atrv_tv
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(atrv_tv_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(atrv_tv_generate_messages atrv_tv_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_cpp _atrv_tv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_cpp _atrv_tv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(atrv_tv_gencpp)
add_dependencies(atrv_tv_gencpp atrv_tv_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS atrv_tv_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/atrv_tv
)
_generate_msg_lisp(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Range.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/atrv_tv
)

### Generating Services

### Generating Module File
_generate_module_lisp(atrv_tv
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/atrv_tv
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(atrv_tv_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(atrv_tv_generate_messages atrv_tv_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_lisp _atrv_tv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_lisp _atrv_tv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(atrv_tv_genlisp)
add_dependencies(atrv_tv_genlisp atrv_tv_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS atrv_tv_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv
)
_generate_msg_py(atrv_tv
  "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Range.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv
)

### Generating Services

### Generating Module File
_generate_module_py(atrv_tv
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(atrv_tv_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(atrv_tv_generate_messages atrv_tv_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/BatteryState.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_py _atrv_tv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/userk/Development/Ros/catkin_ws/src/atrv_tv/msg/RangeArray.msg" NAME_WE)
add_dependencies(atrv_tv_generate_messages_py _atrv_tv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(atrv_tv_genpy)
add_dependencies(atrv_tv_genpy atrv_tv_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS atrv_tv_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/atrv_tv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/atrv_tv
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(atrv_tv_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(atrv_tv_generate_messages_cpp sensor_msgs_generate_messages_cpp)
add_dependencies(atrv_tv_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/atrv_tv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/atrv_tv
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(atrv_tv_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(atrv_tv_generate_messages_lisp sensor_msgs_generate_messages_lisp)
add_dependencies(atrv_tv_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/atrv_tv
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(atrv_tv_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(atrv_tv_generate_messages_py sensor_msgs_generate_messages_py)
add_dependencies(atrv_tv_generate_messages_py std_msgs_generate_messages_py)
