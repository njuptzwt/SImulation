function [ ] = ProduceActuralDistributeData()
%UNTITLED2 此处显示有关此函数的摘要
%对每一个节点进行训练200个样本
m=4200;
train=zeros(m,3);%训练数据集合
X=[19 23 14];%均值集合
for i=1:m
    for j=1:3
        Mu=X(1,j);
        Sigma=0.5;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
xlswrite('ProduceActuralDistributeData.xls',train);%数据写入excel表格保存