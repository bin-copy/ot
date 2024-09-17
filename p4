#Simplex
import numpy as np
from scipy.optimize import linprog
obj = [-5,3,4,-7]
lhs = np.array([[1,1,1,1],
      [1,0,1,0],
      [2,1,1,0]])
rhs = [14,7,13]
bnd = [(0,float('inf'))]*4 #There are 4 bounds because 4 variables

optimize = linprog(c = obj,
                  A_ub = lhs,
                  b_ub = rhs,
                  bounds = bnd,
                  method = 'highs')
print("Optimal Solution")
print("x1=",optimize.x[0])
print("x1=",optimize.x[1])
print("x1=",optimize.x[2])
print("x1=",optimize.x[3])

print("optimal value of z =",optimize.fun)
