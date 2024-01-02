SOURCES := $(wildcard *.bu)
OUTPUT := $(patsubst %.bu, %.ign, $(SOURCES))

all: $(OUTPUT)

%.ign: %.bu
	butane --pretty --strict $< -o $@
