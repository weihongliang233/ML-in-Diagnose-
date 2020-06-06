# 假设外部数据已经整理好，存放于同目录下的 exampledata.txt 文件中

import numpy as np
import math

# 1. 获取原始数据
rowdata = []    # rowdata是存放原始数据的一维数组
tmpdata = np.loadtxt("exampledata.txt") # tmpdata是直接导入之后的二维数组
# print(tmpdata)  # 符合预期
# 用两次循环将二维数组转化为一维数组
for row_i in tmpdata:
    for term_ij in row_i:
        rowdata.append(term_ij) # 利用append方法将tmpdata中的数据转移至rowdata中。至此，row_i, term_ij， tmpdata的使命已经完成，应当删除。
del tmpdata, row_i, term_ij
# np.savetxt("rowdata.txt", rowdata) # 符合预期
# try:
#     print(tmpdata)
# except NameError as e:
#     print("tmpdata 已经完全删除。") # 符合预期
# try:
#     print(row_i)
# except NameError as e:
#     print("row_i 已经完全删除。") # 符合预期
# try:
#     print(term_ij)
# except NameError as e:
#     print("term_ij 已经完全删除。") # 符合预期

# 2. 计算概率向量的维数dim_P。
# 概率向量的维数与原始数据中不重复数据的个数相同。
# 2.1.先构造不重复数据的字典dictionary
dictionary = set(rowdata)

# 2.2.数出字典中元素的个数作为dim_P
dim_P = len(dictionary)
# print(dim_P)    # 与用 Excel 统计的结果相同

# 3.构造概率向量pmb_P。
# 3.1. 先生成频数向量pmb_N。
pmb_N = []
for iterm in dictionary:
    pmb_N.append(rowdata.count(iterm))
# print(pmb_N)    # 符合预期
del iterm, rowdata
# try:
#     print(rowdata)
# except NameError as e:
#     print("rowdata 已经完全删除。") # 符合预期
# try:
#     print(iterm)
# except NameError as e:
#     print("iterm 已经完全删除。") # 符合预期

# 3.2. 欲知频率，还须知总频数。
sum_N = 0
for iterm in pmb_N:
    sum_N += iterm
# print(sum_N)  # 符合预期
del iterm
# try:
#     print(iterm)
# except NameError as e:
#     print("iterm 已经完全删除。") # 符合预期

# 3.3.用频率估计概率，生成概率向量pmb_P。
# 频率=频数/总频数
pmb_P = []
for i in range(0, dim_P - 1):
    pmb_P.append(pmb_N[i] / sum_N)
# print(pmb_P)  # 符合预期
del pmb_N, sum_N, i
# try:
#     print(pmb_N)
# except NameError as e:
#     print("pmb_N 已经完全删除。") # 符合预期
# try:
#     print(sum_N)
# except NameError as e:
#     print("sum_N 已经完全删除。") # 符合预期
# try:
#     print(i)
# except NameError as e:
#     print("i 已经完全删除。") # 符合预期

# 3.4. 将 pmb_P 的各分量由大到小排列
pmb_P.sort(reverse=True)
# np.savetxt("pmb_P_sorted.txt", pmb_P)    # 符合预期

# 4. 询问所求 Renyi 熵的阶数 order_alpha
# 注意检验是否非负。
while 1:
    order_alpha = input("请输入阶数（无限阶用infty）：")
    if order_alpha != "infty":
        try:
            order_alpha = float(order_alpha)
            # if order_alpha == 1:
            #     print("it's able!")   # 这个小实验说明在python中，浮点数可以说“相等”
        except ValueError as e:
            print("请输入非负数或infty！")
            continue
        if order_alpha < 0:
            print("请输入非负值！")
            continue
        break
    order_alpha = -1.0  # 用-1.0来标记无限阶
    break

# 5. 定义计算函数
def zero_order_renyi_entropy():
    result = math.log(dim_P)
    return result

def one_order_renyi_entropy():
    element = []
    sum_of_elements = 0
    for i in range(0, dim_P - 1):
        p_i = pmb_P[i]
        element.append(-p_i*math.log(p_i))
        sum_of_elements += element[i]
    # np.savetxt("element.txt", element)
    return sum_of_elements

def infty_order_renyi_entropy():
    result = -math.log(pmb_P[0])    # pmb_P[0] 是 p_i 中的最大值
    return result

def other_order_renyi_entropy(order):
    element = []
    sum_of_elements = 0
    for i in range(0, dim_P - 1):
        p_i = pmb_P[i]
        element.append(p_i**order)
        sum_of_elements += element[i]
    # np.savetxt("element.txt", element)
    result = 1 / (1 - order) * math.log(sum_of_elements)
    return result

# 6. 输出Renyi 熵
if order_alpha == 0:
    print(zero_order_renyi_entropy())
elif order_alpha == 1:
    print(one_order_renyi_entropy())
elif order_alpha == -1:
    print(infty_order_renyi_entropy())
else:
    print(other_order_renyi_entropy(order_alpha))