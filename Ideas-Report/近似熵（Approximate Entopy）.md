# Introduction of Approximate Entopy

[近似熵](https://en.wikipedia.org/wiki/Approximate_entropy)是一种度量序列规律程度，或者可预测程度的计算方法。一般来讲，所谓的$moment$ $statistics$计算数据的均值，方差等量，在度量序列的规律性时失效，所以往往要借助“熵”。而准确地熵计算需要大量数据，并且易受系统噪音的影响。故而，在$regularity$ $statistics$的基础上，发展了一种用于真实数据的改进方法，也就是近似熵。**近似熵值越小，序列越可预测，规律性越强**后面会看到，近似熵和样本熵有很多相似之处，但也有不同。

# The Algorithm

step1：选取长度为$N$的均匀时间序列$u(1), u(2), \ldots, u(N)$

step2：定义整数$m$,为嵌入维度（和样本熵中的定义一样），正实数$r$为容忍度

step3：在原序列中取一组m维向量$\mathbf{x}(1), \mathbf{x}(2), \ldots, \mathbf{x}(N-m+1)$，其中$\mathbf{x}(i)=[u(i), u(i+1), \ldots, u(i+m-1)]$

step4：构造$C_{i}^{m}(r)=(\text { number of } x(j) \text { such that } d[x(i), x(j)] \leq r) /(N-m+1)$。其中函数d的定义为：$d\left[x, x^{*}\right]=\max _{a}\left|u(a)-u^{*}(a)\right|$。注意统计满足条件的$x(j)$时，包括$x(i)$自身。这是和样本熵的重要区别。同时也是不足之处。

step5：定义$$\Phi^{m}(r)=(N-m+1)^{-1} \sum_{i=1}^{N-m+1} \log \left(C_{i}^{m}(r)\right)$$

step6：定义$$\mathrm{ApEn}=\Phi^{m}(r)-\Phi^{m+1}(r)$$

# Python Implementation
```
import numpy as np


def ApEn(U, m, r) -> float:
    """Approximate_entropy."""

    def _maxdist(x_i, x_j):
        return max([abs(ua - va) for ua, va in zip(x_i, x_j)])

    def _phi(m):
        x = [[U[j] for j in range(i, i + m - 1 + 1)] for i in range(N - m + 1)]
        C = [
            len([1 for x_j in x if _maxdist(x_i, x_j) <= r]) / (N - m + 1.0)
            for x_i in x
        ]
        return (N - m + 1.0) ** (-1) * sum(np.log(C))

    N = len(U)

    return abs(_phi(m + 1) - _phi(m))


# Usage example
U = np.array([85, 80, 89] * 17)
print(ApEn(U, 2, 3))
1.0996541105257052e-05

randU = np.random.choice([85, 80, 89], size=17 * 3)
print(ApEn(randU, 2, 3))
0.8626664154888908
```
# Advantages
* 低运算，适用于小数据
* 对噪音不敏感

# Limitations
* 依赖记录长度
* 相对不连贯
