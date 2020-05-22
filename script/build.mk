# 依赖的其他模块
# NEED_MOUDLE := calc_add

# 获取源文件列表
# MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
# MODULE_DIR := $(patsubst %/, %, $(dir $(MAKEFILE_PATH)))
# MODULE_NAME := $(notdir $(MODULE_DIR))
# MODULE_SRC := $(shell ls $(MODULE_DIR) | grep '\.c')

# SRC_LIST += $(MODULE_NAME)
# NEED_MOUDLE += $(MODULE_NAME)

# MODULE_INC := $(call build_include_path, $(NEED_MOUDLE))


TAG_NAME := $(OUT_PATH)/$(MODULE_NAME).o
$(TAG_NAME):PRIVATE_MODULE_INC := $(MODULE_INC)
$(TAG_NAME):PRIVATE_MODULE_DIR := $(MODULE_DIR)

$(TAG_NAME): $(patsubst %, $(MODULE_DIR)/%, $(MODULE_SRC))
	gcc -c $^ $(PRIVATE_MODULE_INC) -o $@ -g


TAG_NAME := $(MODULE_NAME)_cppcheck
$(TAG_NAME):PRIVATE_MODULE_INC := $(MODULE_INC)
$(TAG_NAME):PRIVATE_MODULE_DIR := $(MODULE_DIR)

$(TAG_NAME): $(patsubst %, $(MODULE_DIR)/%, $(MODULE_SRC))
	cppcheck --enable=all --suppress=missingIncludeSystem $(PRIVATE_MODULE_INC) $(PRIVATE_MODULE_DIR)
