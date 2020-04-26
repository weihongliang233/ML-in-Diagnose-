# Introduction to Sample Entropy 

[样本熵](https://en.wikipedia.org/wiki/Sample_entropy)(sample entropy)是近似熵(approximate entropy)的改进方法，用于估计生物信号（time-series）的复杂度（complexity）。样本熵相较于近似熵算法的差别主要体现在，在计算template vector之间的差别时，近似熵要计算和自己的差别，而样本熵不需要。**样本熵越小，序列越可预测，越规律**。

# Algorithm of Sample Entropy

嵌入维度（embedding dimension）：$m$ 一般取数值2

容忍度（tolerance）：$r$ 一般取数值 $0.2 \times std$，其中$std$为标准差

时间序列长度：$N$

在该算法中默认$\delta = 1$，如果改变$\delta$的取值，则得到Multiscale Entropy，算法其他部分不改变

设有一个时间序列：$N = [x_{1},x_{2},x_{3},...,x_{N}]$

定义template vector：$X_{m} (i)= [x_{i},x_{i+1},...,x_{m-1}]$这里的m就是所谓的嵌入维度，也就是说，所谓的template vector就是依次取时间序列中长度为m的一个子序列。

定义Chebyshev distance:$d[X_{m}(i),X_{m}(j)],i \not= j$可以取最一般的欧几里得距离。

那么，样本熵被定义为：$SampEn = -log(\frac{A}{B})$。

其中$A = $满足$d[X_{m}(i),X_{m+1}(j)]<r$的矢量数目

$B = $满足$d[X_{m}(i),X_{m}(j)]<r$的矢量数目

# Python Code

```
 1 import numpy as np
 2 
 3 
 4 def sampen(L, m, r):
 5     N = len(L)
 6     B = 0.0
 7     A = 0.0
 8 
 9     # Split time series and save all templates of length m
10     xmi = np.array([L[i : i + m] for i in range(N - m)])
11     xmj = np.array([L[i : i + m] for i in range(N - m + 1)])
12 
13     # Save all matches minus the self-match, compute B
14     B = np.sum([np.sum(np.abs(xmii - xmj).max(axis=1) <= r) - 1 for xmii in xmi])
15 
16     # Similar for computing A
17     m += 1
18     xm = np.array([L[i : i + m] for i in range(N - m + 1)])
19 
20     A = np.sum([np.sum(np.abs(xmi - xm).max(axis=1) <= r) - 1 for xmi in xm])
21 
22     # Return SampEn
23     return -np.log(A / B)
```



