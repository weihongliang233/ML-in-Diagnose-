import numpy as np
from renEn1 import *
import math


whole_data = np.loadtxt('example.txt')
data = whole_data[:,1]

print('zero_order entropy:',renEn(data,2,0))
print('first_order entropy:',renEn(data,2,1))
print('second_order entropy:',renEn(data,2,2))
print('infinity_order entropy:',renEn(data,2,-1))