#
# \brief  Build configurations for 'base-hw' on SABRE Lite
# \author Nikolay Golikov <nik@ksyslabs.org>
# \author Josef Soentgen
# \author Martin Stein
# \author Praveen Srinivas (IIT Madras, India)
# \date   2014-02-25
#

# denote wich specs are also fullfilled by this spec
SPECS += hw platform_imx6

# configure multiprocessor mode
NR_OF_CPUS = 1

# set address where to link the text segment at
LD_TEXT_ADDR ?= 0x30001000

# add repository relative include paths
REP_INC_DIR += include/platform/sabrelite

# include implied specs
include $(call select_from_repositories,mk/spec-hw.mk)
include $(call select_from_repositories,mk/spec-platform_imx6.mk)
