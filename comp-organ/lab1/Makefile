# Usage:
# make			# generate all files needed and store in ./out
# make gcc		# generate executable
# make clean	# remove directory ./out
.PHONY = all clean gcc

all: 
		@echo "Checking.."
		mkdir -p out
		riscv64-linux-gnu-gcc -static -E src/main.c -o out/main.i
		riscv64-linux-gnu-gcc -static -S out/main.i -o out/main.s -Og
		riscv64-linux-gnu-gcc -static -c out/main.s -o out/main.o -march=rv64g
		riscv64-linux-gnu-objdump -D out/main.o > out/main.objdump.s
		riscv64-linux-gnu-gcc -static src/main.c -o out/main -Og
		@echo "command: spike \$$(which pk) ./out/main"
		@echo "command: cat ./out/main.objdump.s"
gcc:
		@echo "Checking.."
		mkdir -p out
		gcc src/main.c -o out/main
		@echo "command: ./out/main"
clean:
		@echo "Cleaning up..."
		rm -rvf out/*
		rm -d out
