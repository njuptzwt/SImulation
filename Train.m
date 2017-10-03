function [FPC,Mu,dmax] = Train(train)
%这个函数用来训练已知的数据样本得到最大的距离阈值dMax
%首先需要对数据进行标准化处理。之后使用PCA主成分分析的方法，求解第一主成分，求解最大的距离值
mu=mean(train); 
Mu=mu;
train_norm=bsxfun(@minus,train, mu);  
sigma=std(train_norm);  
train_norm=bsxfun(@rdivide, train_norm, sigma);  
X=train_norm; % just for convience  
[m,n]=size(X);
d=zeros(1,m);
U=zeros(n);%U代表特征向量矩阵
S=zeros(n);%S代表特征值对角矩阵
Cov=1/m *(X'*X);%协方差矩阵
[U,S,V]=svd(Cov); %奇异值分解求解特征向量
FPC=U(:,1);
%求解各个数据向量值到第一主成分坐标轴的距离
for i=1:m
    s1=train(i,:)-mu;
    d1=norm(s1,2);
    d2=s1*FPC;
    di=sqrt(d1.^2-d2.^2);
    d(1,i)=di;
end
dmax=max(d);
fprintf('compute cov done.\n');  
end

