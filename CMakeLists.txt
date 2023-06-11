cmake_minimum_required(VERSION 3.16)

project(HealthAppDEMO VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appHealthAppDEMO
    main.cpp
    usermanager.cpp
    usermanager.hpp
)

qt_add_qml_module(appHealthAppDEMO
    URI HealthAppDEMO
    VERSION 1.0
    QML_FILES Main.qml
    LoginPage.qml
    MainPage.qml
)

set_target_properties(appHealthAppDEMO PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHealthAppDEMO
    PRIVATE Qt6::Quick
)

install(TARGETS appHealthAppDEMO
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
