## import numpy as np

## x = np.array([1,2,3,4])

## print(x)


## x = np.matrix([[1,2,3,4],[5,6,7,8],[9,10,11,12]])

## x


## x1 = np.arange(12).reshape(3,4)#3行4列矩阵，默认按行排列

## x2 = np.arange(12).reshape(4,3)#4行3列矩阵，按行排列

## x3 = np.arange(12).reshape((4,3),order='F')#按列排列


## import pandas as pd

## index=['r1','r2','r3']

## columns=['c1','c2','c3','c4']

## x1 = pd.DataFrame(x1,index=index,columns=columns)

## x1


## A = np.arange(1,13).reshape(3,4)

## A

## A.T


## x = np.array([1,2,3,4,5,6,7,8,9,10]).reshape((1,-1))

## type(x)


## x.T

## (x.T).shape


## x = np.array([1,2,3,4,5,6,7,8,9,10]).reshape((-1,1))

## x.shape


## A = B = np.arange(1,13).reshape((3,4),order='F')

## A+B

## A-B


## c =2

## c*A


## A = np.arange(1,13).reshape((3,4),order='F')

## B = np.arange(1,13).reshape((4,3),order='F')

## np.dot(A,B)


## A = np.arange(1,17).reshape((4,4),order='F')

## np.diag(A)


## A = np.arange(1,17).reshape((4,4),order='F')

## np.diag(np.diag(A))


## np.identity(3)


## A = np.random.normal(0,1,(4,4))

## np.linalg.inv(A)

## np.dot(np.linalg.inv(A),A)


## A = np.identity(4)+1

## A_eig = np.linalg.eig(A)

## Λ = np.diag(A_eig[0])

## U = A_eig[1]

## Λ,U

## np.dot(np.dot(U,Λ),U.T)

## np.dot(U.T,U)


## A = np.identity(4)+1

## cho = np.linalg.cholesky(A)

## np.dot(cho,cho.T)


## np.prod(np.diag(cho)**2)

## np.linalg.det(A)


## A = np.arange(1,19).reshape((3,6),order='F')

## A

## d = np.linalg.svd(A,full_matrices=0)[1]

## d

## u = np.linalg.svd(A,full_matrices=0)[0]

## u

## v = np.linalg.svd(A,full_matrices=0)[2]

## v

## np.dot(np.dot(u,np.diag(d)),v)

## np.dot(u.T,u,out=None,)

## np.dot(v,v.T)


## A = np.arange(1,17).reshape((4,4),order='F')

## qr = np.linalg.qr(A)

## Q = qr[0]

## R = qr[1]

## np.dot(Q,R)

## np.dot(Q.T,Q)


## A = np.arange(1,17).reshape((4,4),order='F')

## MP = np.linalg.pinv(A)#广义逆


## np.dot(np.dot(A,MP),A)


## np.dot(np.dot(MP,A),MP)


## np.dot(A,MP).T

## np.dot(A,MP)


## np.dot(MP,A).T

## np.dot(MP,A)


## A = np.arange(1,5).reshape((2,2),order='F')

## B = np.ones((2,2))

## A

## B

## np.kron(A,B)


## A = np.arange(1,13).reshape((3,4),order='F')

## A

## A.shape


## A = np.arange(1,13).reshape((3,4),order='F')

## A

## A.sum(axis=1)#行和

## A.mean(axis=1)#行平均

## A.sum(axis=0)#列和

## A.mean(axis=0)#列平均


## A = np.random.normal(0,1,(4,4))

## A

## np.linalg.inv(np.dot(A,A.T))


## A = np.arange(1,17).reshape((4,4),order='F')

## A

## np.triu(A,1)  #上三角，不带对角线

## np.triu(A,0)  #上三角，带对角线

## np.tril(A,-1) #下三角，不带对角线

## np.tril(A,0)  #下三角，带对角线


## A = np.array([[1,4,7],[2,5,8],[3,6,9]])

## A

## x = np.array([1,2,3])

## np.linalg.solve(np.tril(A,0),x)#系数矩阵为下三角矩阵

## np.linalg.solve(np.triu(A,0).T,x)#系数矩阵为上三角矩阵的转置矩阵

## np.linalg.solve(np.tril(A,0).T,x)#系数矩阵为下三角矩阵的转置矩阵


## A = np.arange(1,13).reshape((3,4),order='F')

## A

## W = np.where(A)

## W[0].reshape(3,4)

## W[1].reshape(3,4)


## A[W[0].reshape(3,4)>W[1].reshape(3,4)]=0 #上三角矩阵

## A

## A = np.arange(1,13).reshape((3,4),order='F')

## A[W[0].reshape(3,4)<W[1].reshape(3,4)]=0 #下三角矩阵

## A


## x = np.random.normal(0,1,(4,4))

## x

## np.linalg.det(x)


## x = np.arange(1,13).reshape((3,4),order='F')

## x

## vec = x.flatten('F')

## vec

## vech = x.flatten('C')

## vech


## import pandas as pd

## x = np.arange(20,dtype=float)

## y = pd.DataFrame(index=None)

## z = pd.DataFrame(index=None)

## def tslag(x,k,trim):

##   if trim==False:

##     for k in np.arange(4):

##       x[0:k] = None

##       y[k+1] = x[0:20]

##     return(y)

##   if trim==True:

##     for k in np.arange(4):

##       z[k+1] = x[4-k:20-k]

##     return z

## x = np.arange(20,dtype=float)

## tslag(x,k,trim=True)

## tslag(x,k,trim=False)

## 
