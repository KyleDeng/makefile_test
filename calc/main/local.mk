MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))

include ./script/clear.mk

# 依赖的其他模块
NEED_MOUDLE := calc_add

# 获取源文件列表
MODULE_DIR := $(patsubst %/, %, $(dir $(MAKEFILE_PATH)))
MODULE_NAME := $(notdir $(MODULE_DIR))
MODULE_SRC := $(shell ls $(MODULE_DIR) | grep '\.c')

SRC_LIST += $(MODULE_NAME)
NEED_MOUDLE += $(MODULE_NAME)

MODULE_INC := $(call build_include_path, $(NEED_MOUDLE))

include ./script/build.mk
