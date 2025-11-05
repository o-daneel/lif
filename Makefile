CC ?= gcc
CFLAGS_BENCH ?= -std=gnu99 -O3
LFLAGS_BENCH ?= -lpng $(LDFLAGS)
# CFLAGS_CONV ?= -std=c99 -O0 -g 
CFLAGS_CONV ?= -std=c99 -O3 
LFLAGS_CONV ?= $(LDFLAGS)

TARGET_BENCH ?= lifbench
TARGET_CONV ?= lifconv

all: $(TARGET_BENCH) $(TARGET_CONV) $(STB_MODULES)

stb: stb_image.h stb_image_write.h
	wget https://raw.githubusercontent.com/nothings/stb/refs/heads/master/stb_image_write.h -O stb_image_write.h
	wget https://raw.githubusercontent.com/nothings/stb/refs/heads/master/stb_image.h -O stb_image.h

bench: $(TARGET_BENCH)
$(TARGET_BENCH):$(TARGET_BENCH).c lif.h
	$(CC) $(CFLAGS_BENCH) $(CFLAGS) $(TARGET_BENCH).c -o $(TARGET_BENCH) $(LFLAGS_BENCH)

conv: $(TARGET_CONV)
$(TARGET_CONV):$(TARGET_CONV).c lif.h
	$(CC) $(CFLAGS_CONV) $(CFLAGS) $(TARGET_CONV).c -o $(TARGET_CONV) $(LFLAGS_CONV)

.PHONY: clean
clean:
	$(RM) $(TARGET_BENCH) $(TARGET_CONV)
