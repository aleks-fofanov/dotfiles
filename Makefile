UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	include Makefile.macos
else
	include Makefile.linux
endif
