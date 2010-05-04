# - Find python interpreter
# This module finds if Python interpreter is installed and determines where the
# executables are. This code sets the following variables:
#
#  PYTHONINTERP_FOUND - Was the Python executable found
#  PYTHON_EXECUTABLE  - path to the Python interpreter
#

#=============================================================================
# Copyright 2005-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distributed this file outside of CMake, substitute the full
#  License text for the above reference.)

# Allows to choose your python version by setting CMAKE_PYTHON_VERSION to e.g. "2.6"
if (CMAKE_PYTHON_VERSION)
  SET(CMAKE_PYTHON_VERSIONS ${CMAKE_PYTHON_VERSION})
else (CMAKE_PYTHON_VERSION)
  SET(CMAKE_PYTHON_VERSIONS 2.6 2.5 2.4 2.3 2.2 2.1 2.0 1.6 1.5)
endif (CMAKE_PYTHON_VERSION)

FOREACH(_CURRENT_VERSION ${CMAKE_PYTHON_VERSIONS})
  FIND_PROGRAM(PYTHON_EXECUTABLE
    NAMES python${_CURRENT_VERSION}
  PATHS
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Python\\PythonCore\\${_CURRENT_VERSION}\\InstallPath]
  )
ENDFOREACH(_CURRENT_VERSION)

# handle the QUIETLY and REQUIRED arguments and set PYTHONINTERP_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PythonInterp DEFAULT_MSG PYTHON_EXECUTABLE)

MARK_AS_ADVANCED(PYTHON_EXECUTABLE)

