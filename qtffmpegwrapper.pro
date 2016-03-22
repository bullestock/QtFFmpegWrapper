TARGET = qtffmpegwrapper
TEMPLATE = lib
CONFIG += staticlib

# ##############################################################################
# Modify here: set FFMPEG_LIBRARY_PATH and FFMPEG_INCLUDE_PATH
# ##############################################################################

# Set FFMPEG_LIBRARY_PATH to point to the directory containing the FFmpeg import libraries (if needed - typically for Windows), i.e. the dll.a files
FFMPEG_LIBRARY_PATH = c:/lang/ffmpeg-2.3.3-x64/bin

# Set FFMPEG_INCLUDE_PATH to point to the directory containing the FFMPEG includes (if needed - typically for Windows)
FFMPEG_INCLUDE_PATH = c:/lang/ffmpeg-2.3.3-x64/include


# ##############################################################################
# Do not modify: FFMPEG default settings
# ##############################################################################

# Sources for QT wrapper
SOURCES += QVideoEncoder.cpp QVideoDecoder.cpp
HEADERS += QVideoEncoder.h QVideoDecoder.h

# Set list of required FFmpeg libraries
LIBS += -lavutil \
    -lavcodec \
    -lavformat \
    -lswscale

# Add the path
LIBS += -L$$FFMPEG_LIBRARY_PATH
INCLUDEPATH += QVideoEncoder
INCLUDEPATH += $$FFMPEG_INCLUDE_PATH

# Requied for some C99 defines
DEFINES += __STDC_CONSTANT_MACROS

isEmpty(PREFIX) {
    PREFIX = /usr/local
}

library.files = libqtffmpegwrapper.a
library.path = $$PREFIX/lib

headers.files = $$HEADERS
headers.path = $$PREFIX/include

INSTALLS += library headers

# ##############################################################################
# FFMPEG: END OF CONFIGURATION
# ##############################################################################
