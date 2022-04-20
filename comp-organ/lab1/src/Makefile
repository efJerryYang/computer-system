# Usage:
# make			# compile all binary
# make clean	# remove all binaries and objects
.PHONY = all clean

CC = riscv64-linux-gnu-gcc

LINKERFLAG = -lm

SRCS := $(wildcard *.c)
BINS := $(SRCS:%.c=%)

all: ${BINS}

%: %.o
		@echo "Checking.."
		${CC} ${LINKERFLAG} $< -o $@

%.o: %.c 
		@echo "Creating object.."
		${CC} -c $<

# %.s: %.c 
# 		@echo "Creating assembly.."
# 		${CC} -S $<

clean:
		@echo "Cleaning up..."
		rm -rvf *.o ${BINS}
