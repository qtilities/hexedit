#===============================================================================
# Editable project configuration
#
# Essential, non translatable application information (except DESCRIPTION).
# Translatable strings are passed via code.
#===============================================================================
string(TOLOWER ${PROJECT_NAME} PROJECT_ID)
list(APPEND PROJECT_CATEGORIES "Qt;Utility") # Freedesktop menu categories
list(APPEND PROJECT_KEYWORDS   "hex;editor")
set(PROJECT_AUTHOR_NAME        "qtilities")
#set(PROJECT_AUTHOR_EMAIL       "") # Used also for organization email
set(PROJECT_COPYRIGHT_YEAR     "2015-2023")  # TODO: from git
set(PROJECT_DESCRIPTION        "Hex editor")
set(PROJECT_ORGANIZATION_NAME  "${PROJECT_AUTHOR_NAME}")  # Might be equal to PROJECT_AUTHOR_NAME
set(PROJECT_ORGANIZATION_URL   "${PROJECT_ORGANIZATION_NAME}.github.io")
set(PROJECT_HOMEPAGE_URL       "https://${PROJECT_ORGANIZATION_URL}")
set(PROJECT_REPOSITORY_URL     "https://github.com/${PROJECT_ORGANIZATION_NAME}/hexedit")
set(PROJECT_REPOSITORY_BRANCH  "master")
set(PROJECT_SPDX_ID            "LGPL-2.1-or-later")
set(PROJECT_TRANSLATIONS_DIR   "translations")
#===============================================================================
# Appstream
#===============================================================================
set(PROJECT_APPSTREAM_SPDX_ID "FSFAP")
set(PROJECT_APPSTREAM_ID "io.github.${PROJECT_ORGANIZATION_NAME}.${PROJECT_NAME}")
#===============================================================================
# Adapt to CMake variables
#===============================================================================
set(${PROJECT_NAME}_DESCRIPTION  "${PROJECT_DESCRIPTION}")
set(${PROJECT_NAME}_HOMEPAGE_URL "${PROJECT_HOMEPAGE_URL}")
