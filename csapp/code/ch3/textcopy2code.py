import re
text = r"""
1
P:
2
pushq
%r15
3
pushq
%r14
4
pushq
%r13
5
pushq
%r12
6
pushq
%rbp
7
pushq
%rbx
8
subq
$24, %rsp
9
movq
%rdi, %rbx
10
leaq
1(%rdi), %r15
11
leaq
2(%rdi), %r14
12
leaq
3(%rdi), %r13
13
leaq
4(%rdi), %r12
14
leaq
5(%rdi), %rbp
15
leaq
6(%rdi), %rax
16
movq
%rax, (%rsp)
17
leaq
7(%rdi), %rdx
18
movq
%rdx, 8(%rsp)
19
movl
$0, %eax
20
call
Q
"""

class cpy2code:
    def __init__(self) -> None:
        # load from text
        # ...
        self.text = text
        self.code = str

    def gen_code(self):
        self.code = self.text.strip('\n')
        return self.code

t = cpy2code()
# t.gen_code()
print(t.gen_code())
p = re.compile('')