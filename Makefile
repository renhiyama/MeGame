# Compiler and flags
CC = gcc
CFLAGS = -O3 -Wall -Wno-missing-braces -Iinclude -Iinclude/external -Ilib_socketyc

# Paths

TARGET = main

# Detect OS and set linker flags
ifeq ($(OS),Windows_NT)
    # Windows-specific linker flags
	LIBDIR = lib/raylib
    LDFLAGS = -L$(LIBDIR) -lraylib -lopengl32 -lgdi32 -lwinmm
    TARGET_EXT = .exe
else
    # Linux-specific linker flags
    
	LIBDIR = lib_linux/
    LDFLAGS = -L$(LIBDIR) -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
    TARGET_EXT =    # No extension for Linux
endif

# Main target
$(TARGET)$(TARGET_EXT): main.c
	$(CC) main.c play.c lib_socketyC/client.c -o $(TARGET)$(TARGET_EXT) $(CFLAGS) $(LDFLAGS)

# Clean build files
clean:
	rm -f $(TARGET)$(TARGET_EXT)
