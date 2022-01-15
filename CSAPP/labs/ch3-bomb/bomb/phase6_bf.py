import itertools
import os


for x in itertools.permutations([1, 2, 3, 4, 5, 6], 6):
    x = ' '.join(str(e) for e in x)
    # print(x, type(x))
    text = 'Border relations with Canada have never been better.\n1 2 4 8 16 32\n7 327\n3 0\nIONEFG\n'
    text = text + x + '\n'
    with open('keys.txt','w') as f:  # working dir: with bomb and keys.txt
        f.write(text)
    s = os.popen(f'./bomb keys.txt').read()
    flag  = False if "BOOM!!!" in s else True
    if flag:
        print(s)
        print(text)

# print(s)