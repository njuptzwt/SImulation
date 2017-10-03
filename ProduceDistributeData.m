function [ ] = ProduceDistributeData()
%UNTITLED2 此处显示有关此函数的摘要
%对每一个节点进行训练200个样本
m=4200;
train=zeros(m,3);%训练数据集合
X=[0.3 0.35 0.4];%均值集合
for i=1:m
    for j=1:3
        Mu=X(randperm(3,1));
        Sigma=0.03;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
xlswrite('ProduceDistributeData.xls',train);%数据写入excel表格保存
end

