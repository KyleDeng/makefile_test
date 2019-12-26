# 根据模块名称生成头文件路径
define build_include_path
$(strip \
	$(patsubst %, -I $(SRC_PATH)/%, $(1)) \
)
endef