# ========

# root directory of the makefile
MK_ROOT	= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# ========

# compiler
CC = cc

# compiler flags
CFLAGS = -Wall -Wextra -Werror -std=c99 -ggdb3

# linker files
LFLAGS = # ...

# linker directories
LDFLAGS = # ...

# include directories
IFLAGS = # ...

# preprocessor definitions
DFLAGS =  # ...

# ========

OBJS = $(SRCS:.c=.o)
SRCS = $(MK_ROOT)main.c

# ========

TARGET = $(MK_ROOT)main

# ========

.PHONY : all

all : $(TARGET)

.PHONY : clean

clean :
	rm -f $(TARGET)
	rm -f $(OBJS)

# ========

$(TARGET) : $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LFLAGS)

$(OBJS) : %.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(IFLAGS)

# ========
