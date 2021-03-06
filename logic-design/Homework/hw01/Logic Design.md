# Logic Design

## HW 1

1. 请根据电路图写出逻辑函数

   ![hw01-title1](./img/hw01-title1.png)

   **答：**
   $F=AC(B+D)$​

2. 使用与、或、非门实现同或门，并在logisim中画出电路
   
   **答：**

   $A\odot B=\bar{A}\bar{B}+AB$​

   ![Logisim-hw01-2](./img/Logisim-hw01-2.png)

3. 请在logisim中画出逻辑函数F=ABC+A'B'C',反函数F'的电路
   **答：**
   
   $F=ABC+A'B'C'$
   
   $F'=(ABC+A'B'C')' = (A'+B'+C')\cdot(A+B+C)$
   
   ![Logisim-hw01-3](./img/Logisim-hw01-3.png)
   
4. 请化简逻辑函数$F=ABC+ABD+C^{'} D^{'}+AB^{'} C+A^{'} CD^{'}+AC^{'} D+ABCD$​​​​​​，写出最简逻辑函数并在logisim中画出对应功能的最简电路
   **答：**
   化简$F=ABC+ABD+C'D'+AB'C+A'CD'+AC'D+ABCD$​​​​​​​
   $$
   \begin{aligned}
   F &= AB(C'D')'+C'D'+AB'C+A'CD'+AC'D\\
   &=AB+C'D'+AB'C+A'CD'+AC'D\\
   &=A(B+B'C)+D'(C'+CA')+AC'D\\
   &=A(B+C)+D'(C'+A')+AC'D\\
   &=AB+AC+A'D'+C'(D'+DA)\\
   &=AB+AC+A'D'+C'D'+AC'\\
   &=AB+A+A'D'+C'D'\\
   &=A+(A'+C')D'\\
   &=A+D'
   \end{aligned}
   $$

   ![Logisim-hw01-4](./img/Logisim-hw01-4.png)

