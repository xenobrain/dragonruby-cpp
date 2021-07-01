#!/bin/sh

OSTYPE=`uname -s`
if [ "x$OSTYPE" = "xDarwin" ]; then
  PLATFORM=macos
  DLLEXT=dylib
else
  PLATFORM=linux-amd64
  DLLEXT=so
fi

DRB_ROOT=..
mkdir -p native/$PLATFORM

cmake -Hextension -Bnative/$PLATFORM/build && cmake --build native/$PLATFORM/build

$DRB_ROOT/dragonruby-bind --output=native/ext-bindings.c extension/extension.h
clang \
  -isystem $DRB_ROOT/include -I. \
  -fPIC -shared native/ext-bindings.c native/$PLATFORM/build/libextension.a -o native/$PLATFORM/ext.$DLLEXT
