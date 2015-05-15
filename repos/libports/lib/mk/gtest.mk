
#LIBS += libgtest_main_host
#LIBS += libgtest_host
#LIBS += libgtest_libc++_host
LIBS += libgtest_main_libc++_host bionic

SRC_CC += dummies.cc

SHARED_LIB =yes

vpath %.cc $(REP_DIR)/src/lib/gtest
