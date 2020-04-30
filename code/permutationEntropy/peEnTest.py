from peEn import *
import numpy as np

data = np.loadtxt('example.txt')
data = data[:,1]

op = ordinal_patterns(data,5,2)
pe_en = p_entropy(op)
print(pe_en)

rand = np.random.rand(300)
opr = ordinal_patterns(rand,5,2)
rand_en = p_entropy(opr)
print(rand_en)