/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */

#endif
//1
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y)
{
  return ~(~(~x & y) & ~(x & ~y));
}
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void)
{
  return 1 << 31;
}
//2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) //**
{
  int y = x + 1; // Tmin == -Tmin, check 0
  // return !(y ^ (~y + 1)) && y;
  return !(y ^ (~y + 1)) & !(!y);
}
/* 
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x) // **
{
  // return !((x & 0xAAAAAAAA) ^ 0xAAAAAAAA);
  int mask = 0xAA; // 0xAA
  // mask |= (mask << 0x08);  // 0xAAAA
  // mask |= (mask << 0x08);  // 0xAAAAAA
  // mask |= (mask << 0x08);  // 0xAAAAAAAA
  // 0xAA; // 1 byte every time
  // mask |= (mask << 0x18) | (mask << 0x10) | (mask << 0x08); // hex constant
  mask |= (mask << 24) | (mask << 16) | (mask << 8); // cleaner format
  return !((x & mask) ^ mask);
}
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x)
{
  return ~x + 1;
}
//3
/* 
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x)
{
  /*
  0x3(0-9)
  0000_0011 0000_0000 0x30
  ...............0001 0x31
  ...
  ...............0111 0x37
  above here, the least 3 significant bits are not necessary
  ...............1000
  ...............1001
  here, the least significant bit is not necessary
  */
  int flag1 = (0x37 ^ x) >> 3; // flag1 should be 0
  int flag2 = (0x38 ^ x) >> 1; // flag2 should be 0 as well
  return !(!(!flag1) & !(!flag2));
}
/* 
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z)
{
  int flag = !x;        // yield single 0 or 1;
  int mask = flag + ~0; // mask = x ? 0xffffffff : 0x00000000;
  // use ~0 to yield -1
  return (mask & y) | (~mask & z);
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) // Terrible! 4 hours or more on this
{
  // knowledge of digital logic design
  // A'B A<B
  // AB' A>B
  // A NXOR B A==B

  // Omit readability to satisfy the Max ops requirement
  int x_r31_shifts = (x >> 31);
  int y_r31_shifts = (y >> 31);
  int xLy_sgn = x_r31_shifts & !y_r31_shifts; // 1 if x < 0 && y > 0 else 0
  int xGy_sgn = !x_r31_shifts & y_r31_shifts; // 1 if x > 0 && y < 0 else 0

  int leq_un = x ^ y; // discard sign bit, set the other equal bits to 0
  /* MSB algorithm, logN*/
  leq_un |= leq_un >> 1;
  leq_un |= leq_un >> 2;
  leq_un |= leq_un >> 4;
  leq_un |= leq_un >> 8;
  leq_un |= leq_un >> 16;
  leq_un ^= leq_un >> 1; // guarantee bits at the left of the most significant 1 are set 1, then a 1 bit right shift with xor can get the only 1 in leq_un
  leq_un = !(leq_un & x);

  return (!xGy_sgn) & (xLy_sgn | leq_un);

  /* The readable code, but not satisfied the Max ops requirement
  int direct_equal = !(x ^ y);           // 1 if x == y else 0
  int xLy_sgn = (x >> 31) & !(y >> 31);  // 1 if x < 0 && y > 0 else 0
  int xGy_sgn = !(x >> 31) & (y >> 31);  // 1 if x > 0 && y < 0 else 0
  int unsgn_less = (x ^ y) & ~(1 << 31); // discard sign bit, set the other equal bits to 0
  unsgn_less |= unsgn_less >> 1;
  unsgn_less |= unsgn_less >> 2;
  unsgn_less |= unsgn_less >> 4;
  unsgn_less |= unsgn_less >> 8;
  unsgn_less |= unsgn_less >> 16;
  unsgn_less ^= unsgn_less >> 1; // guarantee bits at the left of the most significant 1 are set 1, then a 1 bit right shift with xor can get the only 1 in unsgn_less
  unsgn_less = !(unsgn_less & x);
  return (!xGy_sgn) & (direct_equal | xLy_sgn | unsgn_less);

  */
  /* One example code from stackoverflow
  int a = y + ~x + 1;
  int b = a & 1 << 31 & a;                      // (!b) => y >= x, but maybe overflow
  int c = !!(x & (1 << 31)) & !(y & (1 << 31)); // y > 0, x < 0
  int d = !(x & (1 << 31)) & !!(y & (1 << 31)); // x > 0, y < 0

  int mask1 = !c + ~0;

  // if y > 0 && x < 0, return 1. else return !b
  int ans = ~mask1 & !b | mask1 & 1;

  int mask2 = !d + ~0;

  // if y < 0 && x > 0, return 0, else return ans
  return ~mask2 & ans | mask2 & 0;
  */
}
//4
/* 
 * logicalNeg - implement the ! operator, using all of 
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int logicalNeg(int x)
{
  /*
  1. tried using properties of ~x+1+x=0, but realize that it just 
     does not change anything, then thinking for another method
  2. 0, different from pos or neg, can be recognized using sign,
     here are the algorithm:
   TMin >> 31    1111....1111
  -TMin >> 31    1111....1111
   0    >> 31    0000....0000
  -0    >> 31    0000....0000
  ^ will yield pure 0x00000000, +0x01 to get 1
  the other number x
   x(p) >> 31    0000....0000
  -x    >> 31    1111....1111
   x(n) >> 31    1111....1111
  -x    >> 31    0000....0000
  ^ will yield pure 0xffffffff, +0x01 to get 0

  but to detect TMin in particular, using | instead, and the 
  new pattern would be like this:
  | will yield pure 0x00000000, +0x01 to get 1
  for the others, 
  | will yield pure 0xffffffff, +0x01 to get 0
  */
  return ((x >> 31) | ((~x + 1) >> 31)) + 1;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) // The toughest one, I have to say. Thanks to MSB algor and the bithack web, thanks to stackoverflow :)
{
  // int mask_pos = 0x3ffffffff;
  // int mask_neg = 0xC00000000;
  // int sgn = (x >> 31) + 1; //
  // int mask_sgn = (x >> 31);
  // mask_sgn |= (mask_sgn + 1) << 29;
  // //... assuming the mask_sgn has got the final state
  // x &mask_sgn;
  //  // Max ops are quite loose, first handle it through shifting mask
  int sgn = (x >> 31);               // 000...00 pos, 111...00 neg
  int msb = (~x & sgn) | (x & ~sgn); // do ~ if  x is neg else do nothing
  int mask = 0;                      // 0xAA,0xCC,0xF0,0xFF00,0xFFFF0000
  int r = 0;
  msb |= msb >> 1;
  msb |= msb >> 2;
  msb |= msb >> 4;
  msb |= msb >> 8;
  msb |= msb >> 16;
  //  // msb ^= ((msb >> 1) & ~(1 << 31)); //do logic right shift, but when considering the ~ operation at first when sign bit is 1, this step is unnecessary
  msb ^= msb >> 1;
  // for all cases, I get the most significant bit of two's complement, including the sign bit

  // technique below, learned from http://graphics.stanford.edu/~seander/bithacks.html#IntegerLogLookup
  //  // unsigned int v = msb; // 32-bit value to find the log2 of
  //  // static const unsigned int b[] = {0xAAAAAAAA, 0xCCCCCCCC, 0xF0F0F0F0,
  //  //                                  0xFF00FF00, 0xFFFF0000};
  mask = 0xAA;
  mask |= (mask << 24) | (mask << 16) | (mask << 8); // 0xAAAAAAAA
  r |= !(!(msb & mask));
  mask = 0xCC;
  mask |= (mask << 24) | (mask << 16) | (mask << 8); // 0xCCCCCCCC
  r |= !(!(msb & mask)) << 1;

  mask = 0xF0;
  mask |= (mask << 24) | (mask << 16) | (mask << 8); // 0xF0F0F0F0
  r |= !(!(msb & mask)) << 2;

  mask = 0xFF;
  // mask |= mask << 8;
  r |= !(!(msb & ((mask << 24) | (mask << 16)))) << 4; // 0xFFFF0000

  mask <<= 8;
  r |= !(!(msb & (mask | (mask << 16)))) << 3; // 0xFF00FF00

  //  // for (int i = 4; i > 0; i--) // unroll for speed...
  //  // {
  //  //   r |= ((v & b[i]) != 0) << i;
  //  // }
  // while (msb)
  // {
  //   cnt++;
  //   msb >>= 1;
  // };
  return r + 1 + !(!msb);
}
//float
/* 
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf)
{
  unsigned sgn = (uf >> 31) << 31;         // => 0000...00 or 1000...00
  unsigned exp = (uf & ~(1u << 31)) >> 23; // 32 bits but only use the least significant 8 bits (1 byte)
  unsigned frac = uf & 0x7fffff;           // set 31~23 to 0
  if (!exp)
  {
    uf <<= 1;
    uf |= sgn;
  }
  else if (exp != 0xff) // neither Inf nor NaN
  {
    exp++;
    if (exp == 0xff)
      frac = 0;
    uf = sgn | (exp << 23) | frac;
  }
  return uf;
}
/* 
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf)
{
  unsigned sgn = uf >> 31;            // => ...01 or ...00
  int exp = (uf & ~(1u << 31)) >> 23; // 32 bits but only use the least significant 8 bits (1 byte)
  unsigned frac = uf & 0x7fFFFF;      // set 31~23 to 0

  if (exp <= 0) // 0.f[22]f[21]...f[0]
    return 0;
  else if (exp != 0xff)
  {
    int E = exp - 127;   // 1.f[22]f[21]...f[0] X 2^(E)
    int offset = E - 23; // 1f[22]f[21]...f[0]. X 2^(E-23)
    if (E < 0)
      return 0;
    else if (offset > 7) //[s] | ([7][6][5][4][3][2][1]) ([0] | [22][21]...[0])
      return 0x80000000;
    else
    {
      // -23 <= offset <= 7
      frac |= 0x800000; // set [23] bit to 1=> (1 | 000....0000)
      frac = offset < 0 ? (frac >> -offset) : (frac << offset);
    }
    if (sgn)
      return ~frac + 1;
    else
      return frac;
  }
  else
    return 0x80000000;
}
/* 
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 * 
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while 
 *   Max ops: 30 
 *   Rating: 4
 */
unsigned floatPower2(int x)
{
  // create float 1.0, and operate it x times to yield the expected result

  unsigned uf = 0x3f800000; // float 1.0 = 1 X 2^(0), 0x800000 means that frac part is zeros but [23] is set 1
  /*** float 1.0
   * +-----------------------------------------+
   * |  3    f     8    0    0    0    0    0  |
   * |0|011 1111 1|000 0000 0000 0000 0000 0000|
   * |s|    e     |             f              |
   * +-+----------+----------------------------+
   */
  // unsigned s = 0;
  // unsigned f = 0;
  int e = 0x7f + x; // 127+x
  // int bias = 127;
  // e += x;
  /*** float +INF
   * +-----------------------------------------+
   * |  7    f     8    0    0    0    0    0  |
   * |0|111 1111 1|000 0000 0000 0000 0000 0000|
   * |s|    e     |             f              |
   * +-+----------+----------------------------+
   */
  if (e >= 0xff || (x > 0 && e <= 0)) // overflow
    uf = 0x7f800000;                  // +INF
  else if (e > 0)                     // normal
    uf = e << 23;                     // equivalent to uf = (s << 31) | (e << 23) | f
  else                                // e < 0, underflow
    uf = 0;
  return uf;
  //  // else if (e == 0)                    // denormal
  //  //   uf = 0; // from normal to denormal (X, no, there is no need to do so)
}
