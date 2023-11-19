project(hexedit
    VERSION ${CMAKE_PROJECT_VERSION}
    LANGUAGES CXX
)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(PROJECT_HEADERS
    mainwindow.hpp
    optionsdialog.hpp
    searchdialog.hpp
)
set(PROJECT_SOURCES
    main.cpp
    mainwindow.cpp
    optionsdialog.cpp
    searchdialog.cpp
)
set(PROJECT_RESOURCES
    ${CMAKE_SOURCE_DIR}/resources/application.qrc
)
set(PROJECT_UI_FILES
    optionsdialog.ui
    searchdialog.ui
)
file(GLOB PROJECT_TRANSLATIONS "translations/${PROJECT_NAME}_*.ts")

source_group("UI" FILES ${PROJECT_UI_FILES})
source_group("Sources" FILES ${PROJECT_SOURCES} ${PROJECT_HEADERS})
source_group("Resources" FILES ${PROJECT_RESOURCES})
source_group("Translations" FILES ${PROJECT_TRANSLATIONS})

set(_PROJECT_ALL_FILES
#   ${PROJECT_DESKTOP_FILES}
    ${PROJECT_RESOURCES}
    ${PROJECT_HEADERS}
    ${PROJECT_SOURCES}
#   ${PROJECT_QM_FILES}
    ${PROJECT_TRANSLATIONS}
    ${PROJECT_UI_FILES}
)
if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(${PROJECT_NAME} MANUAL_FINALIZATION ${_PROJECT_ALL_FILES})
else()
    if(ANDROID)
        add_library(${PROJECT_NAME} SHARED ${_PROJECT_ALL_FILES})
    else()
        add_executable(${PROJECT_NAME} ${_PROJECT_ALL_FILES})
    endif()
endif()
unset(_PROJECT_ALL_FILES)

target_include_directories(${PROJECT_NAME} PRIVATE
#   ${HEXEDIT_INCLUDE_DIRS}
)
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt::Widgets
    hexedit::static
#   ${HEXEDIT_LIBRARIES}
)
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${PROJECT_ID}")

target_compile_definitions(${PROJECT_NAME} PRIVATE
    HEXEDIT_EXPORTS
    APPLICATION_DISPLAY_NAME="HexEdit"
    APPLICATION_NAME="${PROJECT_NAME}"
    ORGANIZATION_NAME="${PROJECT_ORGANIZATION_NAME}"
    PROJECT_TEST_LANGUAGE="${PROJECT_TRANSLATION_TEST}"
)
if(PROJECT_TRANSLATION_TEST_ENABLED)
    target_compile_definitions(${PROJECT_NAME} PRIVATE PROJECT_TEST_LANGUAGE_ENABLED=1)
else()
    target_compile_definitions(${PROJECT_NAME} PRIVATE PROJECT_TEST_LANGUAGE_ENABLED=0)
endif()

include(GNUInstallDirs)
set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER ${PROJECT_ORGANIZATION_URL}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
message(STATUS "
Project name:                     ${PROJECT_NAME}
AppStream ID:                     ${PROJECT_APPSTREAM_ID}
Version:                          ${PROJECT_VERSION}
Qt version:                       ${QT_VERSION}
Build type:                       ${CMAKE_BUILD_TYPE}
Install prefix:                   ${CMAKE_INSTALL_PREFIX}
Update translations before build: ${PROJECT_TRANSLATIONS_UPDATE}
")

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(${PROJECT_NAME})
endif()

#include(../PrintAllVariables.cmake)
#print_all_variables()
