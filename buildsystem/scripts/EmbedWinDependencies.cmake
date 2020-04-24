# Copyright 2017-2020 the openage authors. See copying.md for legal info.

if(NOT forward_variables)
	message(FATAL_ERROR "CMake configuration variables not available. Please include(ForwardVariables.cmake)")
endif()

get_filename_component(cl_directory "${cmake_linker}" DIRECTORY)
find_program(dumpbin dumpbin.exe PATHS "${cl_directory}")
if(NOT dumpbin)
	message(SEND_ERROR "Cannot locate dumpbin.")
	return()
endif()

# Paths for applocal and powershell
set(APPLOCAL_SCRIPT "${vcpkg_dir}/../../scripts/buildsystems/msbuild/applocal.ps1")
set(POWERSHELL_COMMAND "$ENV{SYSTEMROOT}/System32/WindowsPowerShell/v1.0/powershell.exe")

# function to wrap the dependency resolving and copying logic on Windows.
# Inspired by `applocal.ps1` from vcpkg which recursively descends into the
# dependency tree of a binary and copies each to the target directory.
function(resolve binary)
	get_filename_component(bin_dir "${binary}" DIRECTORY)
	execute_process(COMMAND "${dumpbin}" /DEPENDENTS "${binary}"
		RESULT_VARIABLE dump_result
		OUTPUT_VARIABLE dump_output
	)
	if(NOT dump_result EQUAL 0)
		message(SEND_ERROR "dumpbin returned ${dump_result}.")
		return()
	endif()
	string(REGEX MATCHALL "    [^\\\n]+\\.dll" dll_list ${dump_output})
	foreach(item ${dll_list})
		string(STRIP "${item}" dll_name)
		set(dll_src_path "${vcpkg_dir}/bin/${dll_name}")
		set(dll_dest_path "${bin_dir}/${dll_name}")
		if(NOT EXISTS "${dll_dest_path}" AND EXISTS "${dll_src_path}")
			message(STATUS "Copying ${dll_name} to ${bin_dir}")
			file(COPY "${dll_src_path}" DESTINATION "${bin_dir}")
			resolve("${dll_dest_path}")
		endif()
	endforeach()
endfunction()


# windeployqt
if(use_windeployqt AND windeployqt)
	foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
		if((file MATCHES "\\.dll$") AND NOT ("${file}" STREQUAL "nyan.dll"))
			resolve("${file}")
			if(windeployqt)
				message(STATUS "Calling windeployqt with ${file}.")
				execute_process(COMMAND "${CMAKE_COMMAND}" -E env "PATH=${vcpkg_dir}/bin;$ENV{PATH}"
					"${windeployqt}"
					--qmldir "${CMAKE_INSTALL_PREFIX}/${asset_dir}/qml"
					--dir "${CMAKE_INSTALL_PREFIX}/bin/qml"
					--plugindir "${CMAKE_INSTALL_PREFIX}/bin/plugins"
					--libdir "${CMAKE_INSTALL_PREFIX}/bin"
					--list "target"
					--verbose 2
					"${file}"
				)
			endif()
		endif()
	endforeach()
endif()

# applocal
if((EXISTS ${POWERSHELL_COMMAND}) AND (EXISTS ${APPLOCAL_SCRIPT}))
	foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
		if(file MATCHES "\\.dll$")
			message(STATUS "Calling applocal.ps1 with ${file}.")
			execute_process(COMMAND "${POWERSHELL_COMMAND}" "${APPLOCAL_SCRIPT}"
					-targetBinary "${file}"
					-installedDir "${vcpkg_dir}/bin"
					-tlogFile "${LOGFILES_DIR}/applocal.log"
					-copiedFilesLog "${LOGFILES_DIR}/applocal_copied_files.log"
					ERROR_FILE "${LOGFILES_DIR}/applocal_error.log"
					OUTPUT_FILE "${LOGFILES_DIR}/applocal_output.log"
			)
		endif()
	endforeach()
endif()

# Copy qt.conf to python-directory
file(COPY "${buildsystem_dir}/templates/qt.conf"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/${py_install_prefix}"
)

# The fonts directory defaults to the same directory as the executable.
# In this case, it is python.exe at `py_install_prefix`.
file(COPY "${vcpkg_dir}/tools/fontconfig/fonts"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/${py_install_prefix}"
)

include("${CMAKE_CURRENT_LIST_DIR}/EmbedFont.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/EmbedPython.cmake")
