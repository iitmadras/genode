include $(REP_DIR)/lib/mk/libunwind_common.inc

#-----------------------------------------------------------------------
# libunwind shared library
#-----------------------------------------------------------------------
libunwind_src_files := \
	src/mi/init.c \
	src/mi/flush_cache.c \
	src/mi/mempool.c \
	src/mi/strerror.c \
	src/mi/backtrace.c \
	src/mi/dyn-cancel.c \
	src/mi/dyn-info-list.c \
	src/mi/dyn-register.c \
	src/mi/map.c \
	src/mi/Lmap.c \
	src/mi/Ldyn-extract.c \
	src/mi/Lfind_dynamic_proc_info.c \
	src/mi/Lget_proc_info_by_ip.c \
	src/mi/Lget_proc_name.c \
	src/mi/Lput_dynamic_unwind_info.c \
	src/mi/Ldestroy_addr_space.c \
	src/mi/Lget_reg.c \
	src/mi/Lset_reg.c \
	src/mi/Lget_fpreg.c \
	src/mi/Lset_fpreg.c \
	src/mi/Lset_caching_policy.c \
	src/mi/Gdyn-extract.c \
	src/mi/Gdyn-remote.c \
	src/mi/Gfind_dynamic_proc_info.c \
	src/mi/Gget_accessors.c \
	src/mi/Gget_proc_info_by_ip.c \
	src/mi/Gget_proc_name.c \
	src/mi/Gput_dynamic_unwind_info.c \
	src/mi/Gdestroy_addr_space.c \
	src/mi/Gget_reg.c \
	src/mi/Gset_reg.c \
	src/mi/Gget_fpreg.c \
	src/mi/Gset_fpreg.c \
	src/mi/Gset_caching_policy.c \
	src/dwarf/Lexpr.c \
	src/dwarf/Lfde.c \
	src/dwarf/Lparser.c \
	src/dwarf/Lpe.c \
	src/dwarf/Lstep_dwarf.c \
	src/dwarf/Lfind_proc_info-lsb.c \
	src/dwarf/Lfind_unwind_table.c \
	src/dwarf/Gexpr.c \
	src/dwarf/Gfde.c \
	src/dwarf/Gfind_proc_info-lsb.c \
	src/dwarf/Gfind_unwind_table.c \
	src/dwarf/Gparser.c \
	src/dwarf/Gpe.c \
	src/dwarf/Gstep_dwarf.c \
	src/dwarf/global.c \
	src/os-common.c \
	src/os-linux.c \
	src/Los-common.c \

# Arch specific source files.

$(foreach arch,$(generate_arches), \
  $(eval libunwind_src_files_$(arch) += \
	src/$(arch)/is_fpreg.c \
	src/$(arch)/regname.c \
	src/$(arch)/Gcreate_addr_space.c \
	src/$(arch)/Gget_proc_info.c \
	src/$(arch)/Gget_save_loc.c \
	src/$(arch)/Gglobal.c \
	src/$(arch)/Ginit.c \
	src/$(arch)/Ginit_local.c \
	src/$(arch)/Ginit_remote.c \
	src/$(arch)/Gregs.c \
	src/$(arch)/Gresume.c \
	src/$(arch)/Gstep.c \
	src/$(arch)/Lcreate_addr_space.c \
	src/$(arch)/Lget_proc_info.c \
	src/$(arch)/Lget_save_loc.c \
	src/$(arch)/Lglobal.c \
	src/$(arch)/Linit.c \
	src/$(arch)/Linit_local.c \
	src/$(arch)/Linit_remote.c \
	src/$(arch)/Lregs.c \
	src/$(arch)/Lresume.c \
	src/$(arch)/Lstep.c \
	))

libunwind_src_files_arm += \
	src/arm/getcontext.S \
	src/arm/Gis_signal_frame.c \
	src/arm/Gex_tables.c \
	src/arm/Lis_signal_frame.c \
	src/arm/Lex_tables.c \

libunwind_src_files_arm64 += \
	src/aarch64/Gis_signal_frame.c \
	src/aarch64/Lis_signal_frame.c \

libunwind_src_files_mips += \
	src/mips/getcontext-android.S \
	src/mips/Gis_signal_frame.c \
	src/mips/Lis_signal_frame.c \

libunwind_src_files_x86 += \
	src/x86/Gos-linux.c \
	src/x86/Los-linux.c \
	
libunwind_src_files_x86_s = \
	src/x86/getcontext-linux.S \
	
libunwind_src_files_x86_64 += \
	src/x86_64/Gstash_frame.c \
	src/x86_64/Gtrace.c \
	src/x86_64/Gos-linux.c \
	src/x86_64/Lstash_frame.c \
	src/x86_64/Ltrace.c \
	src/x86_64/Los-linux.c \
	
	
libunwind_src_files_x86_64_s := \
	src/x86_64/getcontext.S \
	src/x86_64/setcontext.S \
	
LOCAL_SRC_FILES_x86_64 += $(libuwind_src_fies_x86_64_s)


common_c_includes_mips64 := $(LOCAL_PATH)/include/tdep-mips
libunwind_src_files_mips64 := $(libunwind_src_files_mips)

libunwind_src_files_x86_64 += src/elf64.c

libunwind_src_files_x86   += src/elf32.c

libunwind_shared_libraries_target := \
	bionic_libdl \

libunwind_ldflags_host := \
	-nostdlib

libunwind_ldlibs_host := \
	-lc \
	-lpthread \

ifeq ($(debug),true)
libunwind_shared_libraries += \
	liblog \

endif

module := libunwind
module_tag := optional

build_target := STATIC_LIBRARY

build_type := host

include $(REP_DIR)/lib/mk/libunwind_build.inc

LIBS += bionic $(LOCAL_STATIC_LIBRARIES) $(LOCAL_WHOLE_STATIC_LIBRARIES) $(LOCAL_SHARED_LIBRARIES)
INC_DIR += $(LOCAL_C_INCLUDES)  $(LOCAL_C_INCLUDES_x86_64)

CC_LD_OPT = $(LOCAL_LDFLAGS)
CC_OPT = $(LOCAL_CFLAGS)
CC_C_OPT = $(LOCAL_CONLYFLAGS)
CC_CXX_OPT = $(LOCAL_CPPFLAGS)


SRC_C = $(LOCAL_SRC_FILES)  $(LOCAL_SRC_FILES_x86_64)
SRC_S = $(libunwind_src_files_x86_64_s) 

vpath %.c $(LOCAL_PATH)/
vpath %.S $(LOCAL_PATH)/

