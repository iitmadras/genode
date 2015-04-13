#
# \brief  Build configurations for 'base-hw' on Freescale i.MX6
# \author Nikolay Golikov <nik@ksyslabs.org>
# \author Josef Soentgen
# \author Martin Stein
# \date   2014-02-25
#

# denote wich specs are also fullfilled by this spec
SPECS += hw_imx6 trustzone

# include implied specs
include $(call select_from_repositories,mk/spec-hw_sabrelite.mk)
