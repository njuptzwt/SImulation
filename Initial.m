function [train]= Initial(m)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%初始化需要人工拟合的数据，数据取自均值为（0.3，0.35，0.4）方差为0.03的，高斯分布的数据集合。这些都是第一次初始化干的活
m=500;
train=zeros(m,3);%训练数据集合
X=[0.3 0.35 0.4];%均值集合
for i=1:m
    for j=1:3
        Mu=X(randperm(3,1));
        Sigma=0.03;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
%数据集合的空间分布情况
x=train(:,1);
y=train(:,2);
z=train(:,3);
%xlswrite('data.xls',train);%数据写入excel表格保存
scatter3(x,y,z,'b','.');%数据集合的空间分布图形
%grid on
end

