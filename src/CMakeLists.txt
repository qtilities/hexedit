add_subdirectory(library)

if(HEXEDIT_BUILD_APPLICATION)
    add_subdirectory(application)
endif()

if(HEXEDIT_BUILD_PLUGIN)
    add_subdirectory(plugin)
endif()
