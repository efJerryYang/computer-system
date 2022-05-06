# 实验原理

### 1 Booth算法

设乘数 $[x]_\text{补}=x_0.x_1\ldots x_n$ ，被乘数 $[y]_\text{补}=y_0.y_1\ldots y_n$ .

#### (1) $x$ 为任意符号，$y >0$

若
$x>0$，则$[x]_\text{补}\cdot[y]_\text{补}=x\cdot y=[x\cdot y]_\text{补}$.

若$x<0$，则

$$
\begin{aligned}
\hspace{0pt}
        [x]_\text{补}              & = 2+x                  &                        \\
                            & = 2^{n+1}+x            & \quad(\mathrm{mod}\ 2) \\
        [x]_\text{补} \cdot [y]_\text{补} & =  (2^{n+1}+x) \cdot y &                        \\
                            & = 2^{n+1} \cdot y+xy   &                        \\
                            & = 2+xy                 &                        \\
                            & =[x\cdot y]_\text{补}         & \quad(\mathrm{mod}\ 2)
\end{aligned}
$$

#### (2) $x$ 为任意符号，$y <0$ （较正法）

则有


$$
\begin{aligned}\hspace{0pt}
[y]_\text{补} & =2+y \quad(\mathrm{mod}\ 2) 
\end{aligned}
$$

#### (3) $x,y$ 均为任意符号（Booth 算法）

由于 $[x]_\text{补}+[-x]_\text{补}=2$，故
$[-x]_\text{补}=2-[x]_\text{补}=-[x]_\text{补} \quad(\mathrm{mod}\ 2)$，所以
$$
\begin{aligned}
\hspace{0pt}
        [x\cdot y]_\text{补} & =[x]_\text{补}(y-2y_0)                                                                                    \\
                      & =[x]_\text{补}(-y_0+2^{-1}\cdot y_1+\cdots+2^{-n}\cdot y_n)                                               \\
                      & =[x]_\text{补}\left(-y_0+(1-2^{-1})\cdot y_1+\cdots+(2^{-(n-1)}-2^{-n})\cdot y_n\right)                   \\
                      & =[x]_\text{补}\left((y_1-y_0)+(y_2-y_1)2^{-1}+\cdots+(y_n-y_{n-1})2^{-(n-1)}+(y_{n+1}-y_{n})2^{-n}\right) \\
\end{aligned}
$$

其中$y_{n+1} = 0$.

所以输出$z$用递推式给出
$$
\begin{aligned}
\hspace{0pt}
\left[z_0\right]_\text{补}                   & =0                                                                   \\
        [z_1]_\text{补}                   & =2^{-1}\cdot \left( [z_0]_\text{补}+(y_{n+1}-y_{n})[x]_\text{补} \right)           \\
        [z_2]_\text{补}                   & =2^{-1}\cdot \left( [z_1]_\text{补}+(y_{n}-y_{n-1})[x]_\text{补} \right)           \\
        \vdots\\
        [z_k]_\text{补}                   & =2^{-1}\cdot \left( [z_{k-1}]_\text{补}+(y_{n-k+2}-y_{n-k+1})[x]_\text{补} \right) \\
        \vdots\\
        [z_n]_\text{补}                   & =2^{-1}\cdot \left( [z_{n-1}]_\text{补}+(y_{2}-y_{1})[x]_\text{补} \right)         \\
        [x\cdot y]_\text{补}=[z_{n+1}]_\text{补} & =[z_{n}]_\text{补}+(y_{1}-y_{0})[x]_\text{补}                                      \\
    \end{aligned}
$$

所以$y_iy_{i+1}$对部分积的影响为：

| **$y_iy_{i+1}$** | **$y_{i+1}-y_i$** |                操作                 |
| :--------------: | :---------------: | :---------------------------------: |
|       0 0        |         0         |           部分积右移 1 位           |
|       0 1        |         1         | 部分积$+[x]_\text{补}$，再右移 1 位 |
|       1 0        |        -1         | 部分积$-[x]_\text{补}$，再右移 1 位 |
|       0 0        |         0         |           部分积右移 1 位           |

### 2 改进的 Booth 算法（选做）

如果乘数和被乘数的位宽是偶数（两者位宽相同），我们可以把$[x\cdot y]_\text{补}$ 写成：
$$
\begin{aligned}
\hspace{0pt}
        [x\cdot y]_\text{补} & =[x]_\text{补}\left((y_1-y_0)+(y_2-y_1)2^{-1}+\cdots+(y_n-y_{n-1})2^{-(n-1)}+(y_{n+1}-y_{n})2^{-n}\right) \\
                      & =[x]_\text{补}\left((-2y_0+y_1+y_2)2^{-1}+\cdots+(-2y_{n-1}+y_n+y_{n+1})2^{-n}\right)                     \\
    \end{aligned}
$$

于是可以列出
$$
\begin{aligned}
\hspace{0pt}
        [z_0]_\text{补}                 & =0                                                                               \\
        [z_2]_\text{补}                 & =2^{-2}\cdot \left( [z_0]_\text{补}+(-2y_{n-1}+y_n+y_{n+1})[x]_\text{补} \right)               \\
        \vdots\\
        [z_k]_\text{补}                 & =2^{-2}\cdot \left( [z_{k-2}]_\text{补}+(-2y_{n-k+1}+y_{n-k+2}+y_{n-k+3})[x]_\text{补} \right) \\
        \vdots\\
        [z_{n-2}]_\text{补}             & =2^{-2}\cdot \left( [z_{n-4}]_\text{补}+(-2y_3+y_4+y_5)[x]_\text{补} \right)                   \\
        [x\cdot y]_\text{补}=[z_{n}]_\text{补} & =[z_{n-2}]_\text{补}+(-2y_0+y_1+y_2)[x]_\text{补}                                              \\
    \end{aligned}
$$

所以$y_iy_{i+1}y_{i+2}$对部分积的影响为

| **$y_iy_{i+1}y_{i+2}$** | **$-2y_i+y_{i+1}+y_{i+2}$** | 右移 **2** 位前对部分积的操作 |
| :---------------------: | :-------------------------: | :---------------------------: |
|          0 0 0          |              0              |             $+0$              |
|          0 0 1          |              1              |       $+[x]_\text{补}$        |
|          0 1 0          |              1              |       $+[x]_\text{补}$        |
|          0 1 1          |              2              |       $+2[x]_\text{补}$       |
|          1 0 0          |             -2              |       $-2[x]_\text{补}$       |
|          1 0 1          |             -1              |       $-[x]_\text{补}$        |
|          1 1 0          |             -1              |       $-[x]_\text{补}$        |
|          1 1 1          |              0              |             $+0$              |