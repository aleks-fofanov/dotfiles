ifeq ($(OS),Windows_NT)
	$(error Microsoft Windows is not supported)
else ifeq ($(OS),Darwin)
	include Makefile.macos
else
  	include Makefile.linux
endif