all: hello

OUT_PATH = $(abspath ./output)
SRC_PATH = $(abspath ./calc)

SRC_LIST := 

include ./script/tool.mk
-include $(shell find $(SRC_PATH) -name local.mk)

SRC_O := $(patsubst %, %.o, $(SRC_LIST))

ifeq ($(CHECK),)
	SRC_CPPCHECK := $(patsubst %, %_cppcheck, $(SRC_LIST))
else
	SRC_CPPCHECK := $(patsubst %, %_cppcheck, $(CHECK))
endif


hello: $(SRC_O)
	gcc $(patsubst %, $(OUT_PATH)/%, $^) -o $(OUT_PATH)/hello

cppcheck: $(SRC_CPPCHECK)

cppcheck_all:
	cppcheck --enable=all --suppress=missingIncludeSystem \
	$(patsubst %, -I $(SRC_PATH)/%, $(SRC_LIST)) $(patsubst %, $(SRC_PATH)/%, $(SRC_LIST))

.PHONY: All clean debug

clean:
	rm $(OUT_PATH)/*

debug:
	@echo DEBUG: $(MOUDLE_DIR)
