function [ ] = ProduceDistributeData()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%��ÿһ���ڵ����ѵ��200������
m=4200;
train=zeros(m,3);%ѵ�����ݼ���
X=[0.3 0.35 0.4];%��ֵ����
for i=1:m
    for j=1:3
        Mu=X(randperm(3,1));
        Sigma=0.03;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
xlswrite('ProduceDistributeData.xls',train);%����д��excel��񱣴�
end

