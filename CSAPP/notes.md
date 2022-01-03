## 0-Book Overview

本书共计12章

1. Tour: The Life Cycle of A Program

2. Representing and Manipulating Information

   2's complement representation

   asymetic

   arithmetic

3. Machine Language

   C to machine language

   how to read

4. Processor

   1 datapath, simple but not efficient

   pipline cpu

   using HCL to generate Verilog code in order to create real circuits

5. Optimizing Program Performance

   some tricks or code pattern that can improve program performance

   discipline that should follow

   utilize the features of 'superscalar' processor

6. Memory

   real hierarchy of memory beyond the conceptual idea

   RAM, ROM, magnetic-disk, solid state drive, ...

7. Linking

   static and dynamic

8. Exceptional Control Flow

   where it comes from

   define process

9. Virtual Memory

   hardware and software

10. System Level I/O

    file reentrance, metadata

    why it is not suitable to use C libs to write network I/O

11. Network Programming

    a mixture of knowledge above, do review if necessary

    write a web severer

12. Concurrent Programming

    manage concurrent process, avoid errors and maintain efficiency

## 1-A Tour of Computer Systems

instruction set architecture

microarchitecture



> Storage devices that are higher in the hierarchy serve as caches for devices that are lower in the hierarchy. 
>
> P57，我觉得这里说反了吧
>
> P44，明明是高一层的结构是把下面一层的结构当成缓冲区

## 2-Representing and Manipulating Information

>  The byte count is specified as having data type size_t, the preferred data type for expressing the sizes of data structures. 
>
>  ```c
>  #include <stdio.h>
>  
>  typedef unsigned char *byte_pointer;
>  
>  void show_bytes(byte_pointer start, size_t len) {
>    int i;
>    for (i = 0; i < len; i++)
>        printf(" %.2x", start[i]);
>    printf("\n");
>  }
>  
>  void show_int(int x) {
>    show_bytes((byte_pointer) &x, sizeof(int));
>  }
>  
>  void show_float(float x) {
>    show_bytes((byte_pointer) &x, sizeof(float));
>  }
>  
>  void show_pointer(void *x) {
>    show_bytes((byte_pointer) &x, sizeof(void *));
>  }
>  ```
>
>  
>
>  P73 类型size_t和int进行比较，不会出现问题吗？我记得之前有次就是由于表示的不统一让结果发生了异常。
>
>  现在没有问题了，强制类型转换的原理是T2U和U2T，以及，使用十六进制表示，不存在整型还是无符号整型的问题，就是内存里面的数值。
>
>  P105 comparison operators with implicit cast between signed and unsigned
>
>  When an operation is performed where one operand is signed and the other is unsigned, **C implicitly casts the signed argument to unsigned** and performs the operations assuming the numbers are nonnegative.



> ```c
> int lval = 0xFEDCBA98 << 32;
> int aval = 0xFEDCBA98 >> 36;
> unsigned uval = 0xFEDCBA98u >> 40;
> 
> lval 0xFEDCBA98
> aval 0xFFEDCBA9
> uval 0x00FEDCBA
> ```
>
> On many machines, the shift instructions consider only the lower log2 w bits of the shift amount when shifting a w-bit value, and so the shift amount is computed as k mod w.
>
> For example, with w = 32, the above three shifts would be computed as if they were by amounts 0, 4, and 8, respectively, giving results

> Sign extension: 
>
> * two's complement representation with leading zeros of course will not change its numeric value
>
> * those with leading ones, namely negative, the values to be substract (namely the original term added at first$-x_{w-1}\cdot 2^{w-1}$) will never change due to the leading ones.
>
>   for example, assuming that we have 1011 as the two's complement representation of -8 + 3 = -5
>
>   | Two's complement representation | computing numeric value    | substracted value      | numeric value |
>   | ------------------------------- | -------------------------- | ---------------------- | ------------- |
>   | 1 011                           | -8 + 3 = -5                | -8                     | -5            |
>   | 1 1011                          | -16 + 8 + 3 = -5           | -16 + 8 = -8           | -5            |
>   | 1 11011                         | -32 + 16 + 8 + 3 = -5      | -32 +16 + 8 = -8       | -5            |
>   | 1 111011                        | -64 + 32 + 16 + 8 + 3 = -5 | -64 + 32 + 16 + 8 = -8 | -5            |
>
> * then, we can grasp the intuition of 'unchanged substracted value' to yield the same numeric value of Two's complement representation

> signed interger type has a stuff of messy things:
>
> * pure digits like 12345 are regarded as signed implicitly, unless specifiy them with a suffix 'U' or 'u' (e.g. 12345U or 12345u)
> * -MAX-1 rather than the exact numeric value, due to the asymmetric property of two's complement representation
> * cast from short signed to int signed, 'sign extention' with leading zeros or ones
> * cast from short to unsigned, the not specified procedure is "byte first, then type": `short (2 bytes) => int (4 bytes)`, `int => unsigned`. byte expansion might add leading ones to yield an unexpected result for final unsigned variable of its numeric values. type casting from int to unsigned remain its every bit unchanged, which would cause the following results:
>
> ```c
> Consider the following code:
> short sx = -12345; /* -12345 */
> unsigned uy = sx; /* Mystery! */
> printf("uy = %u:\t", uy);
> show_bytes((byte_pointer) &uy, sizeof(unsigned));
> 
> When run on a big-endian machine, this code causes the following output to be printed:
> uy = 4294954951: ff ff cf c7
> This shows that, when converting from short to unsigned, the program first changes the size and then the type. That is, (unsigned) sx is equivalent to (unsigned) (int) sx, evaluating to 4,294,954,951, not (unsigned) (unsigned short) sx, which evaluates to 53,191. Indeed, this convention is required by the C standards.
> ```
>
> * moreover, when right shift operator ">>" is used with signed number (including pure digits?), it might result in the arithmetic shift, yield of which is not absolutely guaranteed.  
> * remember that, hex digits 8 through F have their most significant bits equal to 1.



> One way to avoid such bugs is to never use unsigned numbers.

> Problem here, constants shown in codes are implicitly regarded as signed. 
>
> Then problem occurred, if we use it as an operand of shift operation, like unsigned x=11; x = (x<<2); here x is unsigned, so the computation will operate as both unsigned; but if int x=11; x = (x<<2), then both x and the constant 2 are signed, the operation here will be computed regarding both operands as signed, then if set 2 as -2, what will happend?
>
> * The most positive result should be it cannot pass compilation, then my concerns here will be unnecessary.

pp2, solution:**173**/1105

**68**/1105: pp2_3

**85**/1105: pp2_12（精妙，不只是第二题）

> 本质上是数字逻辑不过关（
>
> x XOR 0 = x
>
> x XOR 1 = x'
>
> 还有，sizeof得出的大小是byte，而不是位，对于w长度，需要对其除以8

> mask 的用法，~0x1 would create a mask that regardless of the width of values
>
> The expression ~0xFF creates a mask where the 8 least-significant bits equal 0 and the rest equal 1. Observe that such a mask will be generated regardless of the word size. By contrast, the expression 0xFFFFFF00 would only work when data type int is 32 bits.

**85**/1105: pp2_13（题意理解错）



> printf problem:
>
> > When printing numeric values with printf, the directives %d, %u, and %x are used to print a number as a signed decimal, an unsigned decimal, and in hexadecimal format, respectively. Note that printf does not make use of any type information, and so it is possible to print a value of type int with directive %u and a value of type unsigned with directive %d. 
>
> Actually, printf does use type information, since it must decide to read how many bytes of memory content to be printed on screen. Considering the following code:
>
> ```c
> typedef unsigned char byte;
> 
> int main()
> {
>     int32_t x = 12345;
>     float y = x;
>     byte *px = &x;
>     printf("hexadecimal\ttype\tnumeric value\taddress\n");
>     printf("%8x\tint32\t%10d\t%#p\n", x, x, &x);
>     printf("%8x\tint32\t%10d\t%#p\n", *(px + 0), x, &x); // I meet a strange case that it just indicates printf used the type information, I can only print every byte of x one time.
>     printf("%8x\tint32\t%10d\t%#p\n", *(px + 1), x, &x);
>     printf("%8x\tint32\t%10d\t%#p\n", *(uint32_t *)&x, x, &x);
>     printf("%8x\tfloat\t%10.1f\t%#p\n", *(uint32_t *)&y, y, &y);
> }
> ```
>
> The output looks something like this:
>
> ```shell
> hexadecimal     type    numeric value   address
>     3039        int32        12345      0X000000000061FE0C
>       39        int32        12345      0X000000000061FE0C
>       30        int32        12345      0X000000000061FE0C
>     3039        int32        12345      0X000000000061FE0C
> 4640e400        float      12345.0      0X000000000061FE08
> ```
>
> It failed to print entire value of x through the same address given by \*(px + 0), but when I explicitly cast the pointer type from *byte* type to *unint32_t* type, it yielded the correct hexadecimal value. Thus, there must be some mechanism behind the usage of type information.

> pointer: the smallest position it can operate is byte (unsigned char \*)
>
> hex: every single hexadecimal digit occupied only 4 bits, thus it is necessary to 2-bit hexadecimal digits as the base unit for assignment or mask. For example, use 0x01 rather than 0x1, and if you want to assign 8 bits of memory with [1000 1100], use 0x8c as a whole rather than attempting to assign it through byte pointer each time to assign it 0xc and 0x8 which is wrong.

> E. f == -(-f)
> Yes, since a floating-point number is negated by simply inverting its sign bit.
>
> H. (f+d)-f == d
> No. For example, when f is 1.0e20 and d is 1.0, the expression f+d will be
> rounded to 1.0e20, and so the expression on the left-hand side will evaluate
> to 0.0, while the right-hand side will be 1.0.



## 3-Machine-Level Representation of Programs

