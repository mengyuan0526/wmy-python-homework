## import numpy as np

## import pandas as pd

## import statsmodels.api as sm

## import statsmodels.formula.api as smf

## from sklearn.model_selection import train_test_split

## df = sm.datasets.get_rdataset("turnout",package="Zelig",site="D:/github_repo/Rdatasets").data

## df

## 
## #对数据进行处理：去空值，处理分类变量race

## df.isnull().sum()#没有空值

## df['race']=df['race'].replace("white",0)

## df['race']=df['race'].replace("others",1)

## df['race'].unique()

## df.index=np.arange(df.shape[0])

## X=df.iloc[:,:4]

## X

## Y=df['vote']

## p=Y.sum()/len(Y)#投票比率为0.746

## 
## #将数据集随机划分为训练子集和测试子集，并返回划分好的样本和标签

## X_train,X_test,y_train,y_test=train_test_split(X,Y,test_size=0.2,random_state=0)

## #x_train训练集特征值

## #y_train训练集目标值

## #x_test测试集特征值

## #y_text测试集目标值，真实值

## 
## #拟合logistic回归方程

## results=sm.Logit(y_train,X_train).fit()

## print(results.summary())

## 

## #预测数据

## y_predict = results.predict(X_test)

## y_predict

## y_predict = np.where(y_predict>0.5,1,0)

## accuracy = (y_predict==y_test).sum()/len(y_test)

## accuracy


## 
## dat = sm.datasets.get_rdataset("aids",package="KMsurv",site="D:/github_repo/Rdatasets").data

## dat

## 
## #对数据进行处理：去空值，处理分类变量race

## dat.isnull().sum()#没有空值

## dat.index=np.arange(dat.shape[0])

## X=dat.iloc[:,:2]

## Y=dat['adult']

## p=Y.sum()/len(Y)

## 
## #将数据集随机划分为训练子集和测试子集，并返回划分好的样本和标签

## X_train,X_test,y_train,y_test=train_test_split(X,Y,test_size=0.2,random_state=0)

## 
## #拟合logistic回归方程

## results=sm.Logit(y_train,X_train).fit()

## print(results.summary())

## 

## X_new=dat['induct']

## X_train,X_test,y_train,y_test=train_test_split(X_new,Y,test_size=0.2,random_state=0)

## results=sm.Logit(y_train,X_train).fit()

## print(results.summary())


## predict = results.predict(X_test)

## y_predict2 = np.where(predict>0.5,1,0)

## accuracy2=(y_test==y_predict2).sum()/len(y_test)

## accuracy2#0.847

