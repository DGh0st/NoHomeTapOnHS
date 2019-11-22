export ARCHS = armv7 arm64
export TARGET = iphone:clang:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoHomeTapOnHS
NoHomeTapOnHS_FILES = Tweak.xm
NoHomeTapOnHS_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
