export TARGET = iphone:latest:13.0
export ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = MobileSlideShow
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoScreenshots
NoScreenshots_FRAMEWORKS = Photos
NoScreenshots_FILES = Tweak.xm
NoScreenshots_CFLAGS += -fobjc-arc -std=c++11

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

