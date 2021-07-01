cmake_minimum_required(VERSION 3.19)
project(extension)

set(CMAKE_CXX_STANDARD 17)

add_library(${PROJECT_NAME} extension.cpp)