project(libhexedit
    VERSION ${CMAKE_PROJECT_VERSION}
    LANGUAGES CXX
)
# TODO: Install and translations

option(HEXEDIT_BUILD_SHARED "Build as shared library [default: OFF]" OFF)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

include(GNUInstallDirs)

set(PROJECT_HEADERS
    ../../include/hexedit/hexedit.hpp
    ../../include/hexedit/chunks.hpp
    ../../include/hexedit/commands.hpp
)
set(PROJECT_SOURCES
    hexedit.cpp
    chunks.cpp
    commands.cpp
)
if(HEXEDIT_SYSTEM_LIBRARY)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(HEXEDIT "hexedit" REQUIRED)
    add_library(hexedit_system INTERFACE)
    target_include_directories(hexedit_system INTERFACE ${HEXEDIT_INCLUDE_DIRS})
    target_link_libraries(hexedit_system INTERFACE ${HEXEDIT_LIBRARIES})
    link_directories(${HEXEDIT_LIBRARY_DIRS})
elseif(HEXEDIT_BUILD_SHARED)
    source_group("Sources" FILES ${PROJECT_SOURCES})
    add_library(hexedit_shared SHARED ${PROJECT_SOURCES})
    add_library(hexedit::shared ALIAS hexedit_shared)
    set_target_properties(hexedit_static PROPERTIES
        VERSION      "${PROJECT_VERSION}"
        SOVERSION    "${PROJECT_VERSION_MAJOR}"
        PUBLIC_HEADER ${PROJECT_HEADERS}
        OUTPUT_NAME   hexedit
    )
    target_compile_definitions(hexedit_shared PRIVATE QTILITIES_HEXEDIT_EXPORTS)
    target_link_libraries(hexedit_shared PUBLIC Qt::Widgets)

    install(TARGETS ${PROJECT_NAME}
        LIBRARY       DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/hexedit")
else()
    source_group("Sources" FILES ${PROJECT_SOURCES} ${PROJECT_HEADERS})
    add_library(hexedit_static STATIC ${PROJECT_SOURCES} ${PROJECT_HEADERS})
    add_library(hexedit::static ALIAS hexedit_static)
    target_sources(hexedit_static PUBLIC ${PROJECT_HEADERS})
    set_target_properties(hexedit_static PROPERTIES
        PUBLIC_HEADER ${PROJECT_HEADERS}
        OUTPUT_NAME   hexedit
    )
    target_compile_definitions(hexedit_static PRIVATE QTILITIES_HEXEDIT_EXPORTS)
    target_include_directories(hexedit_static PUBLIC ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(hexedit_static PUBLIC Qt::Widgets)
endif()
