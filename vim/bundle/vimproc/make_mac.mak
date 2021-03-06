# for Mac.

TARGET=autoload/vimproc_mac.so
SRC=autoload/proc.c
CFLAGS=-O2 -W -Wall -Wno-unused -bundle -fPIC
LDFLAGS+=-lutil

all: $(TARGET)

$(TARGET): $(SRC) autoload/vimstack.c
	llvm-gcc $(CFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)

.PHONY : clean
clean:
	-rm -f $(TARGET)
