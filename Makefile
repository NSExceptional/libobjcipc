export TARGET = iphone:9.0:9.0
include $(THEOS)/makefiles/common.mk
export ADDITIONAL_OBJCFLAGS = -fvisibility=default -fvisibility-inlines-hidden -fno-objc-arc -O2

LIBRARY_NAME = libobjcipc
libobjcipc_FILES = IPC.m Connection.m Message.m
libobjcipc_FRAMEWORKS = CoreFoundation Foundation UIKit
libobjcipc_INSTALL_PATH = /usr/lib/
libobjcipc_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/library.mk

before-stage::
	find . -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 backboardd"