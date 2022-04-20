# Usage:
# make			# compile all binary
# make clean	# remove all binaries and objects
.PHONY = all clean gcc

# CC = riscv64-linux-gnu-gcc

all: 
		@echo "Checking.."
		riscv64-linux-gnu-gcc -static src/main.c -o out/main
		@echo "output: ./out/main"
gcc:
		@echo "Checking.."
		gcc src/main.c -o out/main
		@echo "output: ./out/main"
clean:
		@echo "Cleaning up..."
		rm -rvf out/main
