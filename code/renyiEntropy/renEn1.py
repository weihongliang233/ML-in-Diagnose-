import numpy as np
import math

def data_process(data,w):
    #依据保留位数w处理数据
    factor = 10**w
    data = data*factor
    #乘10^w,取整数,再除以10^w得到保留w位的数据
    data_pro = np.trunc(data)/factor
    return data_pro

def data_possibility(data_pro):
    #np.unique函数返回的第一个数组uniCount[0]是从小到大排列的，原数据中的不重复元素。
    #该算法基于概率，所以第一个数组无用
    #np.unique函数返回的第二个数组uniCount[1]是对不重复元素出现次数的统计数组
    #p就是算法中的P向量，每个元素为pi
    uniCount = np.unique(data_pro, return_counts=True)
    vecP = uniCount[1]
    total = np.sum(vecP)
    p = vecP/total
    return p

def zero_order_en(dimP):
    res = math.log(dimP)
    return res

def one_order_en(p):
    element = -p*np.log(p)
    return np.sum(element)

def inf_order_en(p):
    return -np.log(np.max(p))

def other_order_en(p,alpha):
    P_a = np.sum(p**alpha)
    return (alpha/(1-alpha))*P_a

def renEn(data,w,alpha):
    data_pro = data_process(data,w)
    p = data_possibility(data_pro)
    dimP = len(p)
    if alpha == 0:return zero_order_en(dimP)
    elif alpha == 1:return one_order_en(p)
    elif alpha < 0: return inf_order_en(p)
    else:return other_order_en(p,alpha)


