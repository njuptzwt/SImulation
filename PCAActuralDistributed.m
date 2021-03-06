function [dmax,Mediandmax,Mu,FPC,DistributeTrain,Compare] =PCAActuralDistributed()
%这边可以加一个条件当任何的数值大于当前max+min自动判定为错误数据
%   此处显示详细说明
[train]=xlsread('ProduceActuralDistributeData.xls');
x=train(:,1);
y=train(:,2);
z=train(:,3);
Compare=zeros(7,3);
dmax=zeros(1,7);
Mu=zeros(7,3);%每一个节点都有均值和最大距离值
FPC=zeros(3,7);%每一个节点的最大主成分分量
for i=1:7
  DistributeTrain=train(600*(i-1)+1:600*i,:);
  Compare(i,:)=min(DistributeTrain)+max(DistributeTrain);%下一步比较的时候有用
  DistributeTrain=DistributeTrain./(min(DistributeTrain)+max(DistributeTrain));%标准化数据
mu=mean(DistributeTrain);%求每一个节点的向量的均值
Mu(i,:)=mu;
DistributeTrain_norm=bsxfun(@minus,DistributeTrain, mu);  
sigma=std(DistributeTrain_norm);  
DistributeTrain_norm=bsxfun(@rdivide, DistributeTrain_norm, sigma);  
X=DistributeTrain_norm; % 求标准化后的矩阵  
[m,n]=size(X);
d=zeros(1,m);%每一个向量到第一主成分的值
U=zeros(n);%U代表特征向量矩阵
S=zeros(n);%S代表特征值对角矩阵
Cov=1/m *(X'*X);%协方差矩阵，复杂度n*p^2
[U,S,V]=svd(Cov); %奇异值分解求解特征向量,复杂度p^3,一般情况下n>p
FPC(:,i)=U(:,1);%求解第一主成分，保存数据
%求解各个数据向量值到第一主成分坐标轴的距离
for j=1:m
    s1=DistributeTrain(j,:)-mu;
    d1=norm(s1,2);%返回向量的二范数，斜边长
    d2=s1*FPC(:,i);%直角边长，沿第一主成分方向
    dj=sqrt(d1.^2-d2.^2);%求解第一主成分的特征距离
    d(1,j)=dj;
end
%求解最大值距离
dmax(1,i)=max(d);%求解每一个节点的最大距离值
end
Mediandmax=median(dmax');%中间节点的Global的最大值
end