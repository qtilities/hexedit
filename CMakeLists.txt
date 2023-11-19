cmake_minimum_required(VERSION 3.15)
project(hexedit
    VERSION 0.1.0
    LANGUAGES CXX
)
set(PROJECT_ORGANIZATION_NAME "qtilities")
set(PROJECT_ORGANIZATION_URL "${PROJECT_ORGANIZATION_NAME}.github.io")

option(HEXEDIT_BUILD_APPLICATION                  "Whether to build the hex editor application [default: OFF]" OFF)
option(HEXEDIT_BUILD_PLUGIN                       "Whether to build the QtDesigner plugin      [default: OFF]" OFF)
option(HEXEDIT_SYSTEM_LIBRARY                     "Use HexEdit system library                  [default: OFF]" OFF)
option(HEXEDIT_TRANSLATIONS_UPDATE                "Update source translations                  [default: OFF]" OFF)
option(HEXEDIT_TRANSLATION_TEST_ENABLED           "Whether to enable translation testing       [default: OFF]" OFF)
set   (HEXEDIT_TRANSLATION_TEST "it" CACHE STRING "Country code of language to test in IDE     [default: it]")
set   (HEXEDIT_QT_VERSION 5 CACHE STRING          "Qt version to use                           [default: 5]")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

## Qt
set(CMAKE_AUTOMOC ON)
find_package(QT NAMES Qt${HEXEDIT_QT_VERSION})
find_package(Qt${QT_VERSION_MAJOR} REQUIRED LinguistTools Widgets)

add_subdirectory(src)
