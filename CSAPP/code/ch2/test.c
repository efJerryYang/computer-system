#include <stdio.h>

int main()
{
    unsigned val = 0xffffffff;
    unsigned char *p_byte = &val;
    unsigned marker = 0x7fffffff;
    printf("=================================================\n");
    printf("variable address\tvariable value\tname\n");
    printf("%#p\t%#X\tval\n", &val, val);
    printf("%#p\t%#X\tp_byte\n", &p_byte, p_byte);
    printf("%#p\t%#X\tmarker\n", &marker, marker);
    (*p_byte) ++; // 0xffffff00
    printf("=================================================\n");
    printf("%#p\t%#X\tval\n", &val, val);
    printf("%#p\t%#X\tp_byte\n", &p_byte, p_byte);
    printf("%#p\t%#X\tmarker\n", &marker, marker);
    printf("=================================================\n");
    return 0;
}
/* 
=================================================
variable address        variable value  name
0X000000000061FE1C      0XFFFFFFFF      val
0X000000000061FE10      0X61FE1C        p_byte
0X000000000061FE0C      0X7FFFFFFF      marker
=================================================
0X000000000061FE1C      0XFFFFFF00      val
0X000000000061FE10      0X61FE1C        p_byte
0X000000000061FE0C      0X7FFFFFFF      marker
=================================================
 * The stack looks something like this:
 * +----------------------------------+===============================+----------+
 * +        stack content             +    Address (from high to low) +   name   +
 * +----------------------------------+===============================+----------+
 * +              FF                  +      0X000000000061FE1C+3     +          +
 * +              FF                  +      0X000000000061FE1C+2     +          +
 * +              FF                  +      0X000000000061FE1C+1     +    val   +
 * +              FF                  +      0X000000000061FE1C       +          +
 * +----------------------------------+===============================+----------+
 * +              00                  +                      1B       +          +
 * +              00                  +                      1A       +          +
 * +              00                  +                      19       +          +
 * +              00                  +                      18       +          +
 * +----------------------------------+===============================+----------+
 * +              00                  +      0X000000000061FE17       +          +
 * +              00                  +      0X000000000061FE16       +          +
 * +              00                  +      0X000000000061FE15       +          +
 * +              00                  +      0X000000000061FE14       +  p_byte  +
 * +              00                  +      0X000000000061FE10+3     +          +
 * +              61                  +      0X000000000061FE10+2     +          +
 * +              FE                  +      0X000000000061FE10+1     +          +
 * +              1C                  +      0X000000000061FE10       +          +
 * +----------------------------------+===============================+----------+
 * +              7F                  +      0X000000000061FE0C+3     +          +
 * +              FF                  +      0X000000000061FE0C+2     +          +
 * +              FF                  +      0X000000000061FE0C+1     +  marker  +
 * +              FF                  +      0X000000000061FE0C       +          +
 * +----------------------------------+===============================+----------+
 * 
 * 
 * 我有个问题，C语言指针在64位机器上应该是占64位，也就是8个byte，
 * 从打印的地址来看每个16进制数占4个位也是没毛病"0X000000000061FE10"。
 * 程序运行的时候分配的内存是从栈上来的，从地址高段往低长，
 * 我的机器上测试过是little-endian，那么是低位和低位对齐。
 * 但在这个地方，它分配给p_byte内容的地址是0x10-0x1C，12个byte在这里，
 * 意思是，就还有4个byte是不知道干什么去了。
 */
