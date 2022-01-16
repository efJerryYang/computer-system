
s = input()[2:]
ret = []
for c in s:
    c = hex(ord(c))[2:]
    c = c if len(c) == 2 else '0'+c
    ret.append(c)
ret = ' '.join(ret) + ' 00'
print(ret)