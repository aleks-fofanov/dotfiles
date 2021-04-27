ifeq ($(OS),Windows_NT)
	$(error Microsoft Windows is not supported)
else ifeq ($(OS),OSX)
	include Makefile.macos
else
  	include Makefile.linux
endif