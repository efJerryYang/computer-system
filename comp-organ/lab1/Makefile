# Usage:
# make			# compile all binary
# make clean	# remove all binaries and objects
.PHONY = all clean gcc

# CC = riscv64-linux-gnu-gcc

all: 
		@echo "Checking.."
		riscv64-linux-gnu-gcc -static -E src/main.c -o out/main.i
		riscv64-linux-gnu-gcc -static -S out/main.i -o out/main.s
		riscv64-linux-gnu-gcc -static -c out/main.s -o out/main.o
		riscv64-linux-gnu-objdump -D out/main.o
		riscv64-linux-gnu-gcc -static src/main.c -o out/main
		@echo "output: ./out/main"
gcc:
		@echo "Checking.."
		gcc src/main.c -o out/main
		@echo "output: ./out/main"
clean:
		@echo "Cleaning up..."
		rm -rvf out/main
