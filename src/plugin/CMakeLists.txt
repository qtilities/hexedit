project(hexeditplugin
    VERSION ${CMAKE_PROJECT_VERSION}
    LANGUAGES CXX
)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED Core UiPlugin)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(PROJECT_SOURCES
    hexeditplugin.cpp
    hexeditplugin.hpp
)
source_group("Sources" FILES ${PROJECT_SOURCES})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_add_plugin(${PROJECT_NAME} SHARED MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
        ${CMAKE_SOURCE_DIR}/resources/plugin.qrc
    )
else()
    add_library(${PROJECT_NAME} SHARED
        ${PROJECT_SOURCES}
        ${CMAKE_SOURCE_DIR}/resources/plugin.qrc
    )
endif()
add_library(hexedit::plugin ALIAS ${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} PUBLIC
    Qt::Core
    Qt::Widgets
    Qt::UiPlugin
)
if(PROJECT_BUILD_SHARED)
    target_link_libraries(${PROJECT_NAME} PRIVATE hexedit::shared)
else()
    target_link_libraries(${PROJECT_NAME} PRIVATE hexedit::static)
endif()

set(PLUGIN_INSTALL_DIR "${QT${QT_VERSION_MAJOR}_INSTALL_PREFIX}/${QT${QT_VERSION_MAJOR}_INSTALL_PLUGINS}/designer")

install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION "${PLUGIN_INSTALL_DIR}"
    LIBRARY DESTINATION "${PLUGIN_INSTALL_DIR}"
    BUNDLE DESTINATION  "${PLUGIN_INSTALL_DIR}"
)
if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_target(${PROJECT_NAME})
endif()
