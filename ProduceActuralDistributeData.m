function [ ] = ProduceActuralDistributeData()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%��ÿһ���ڵ����ѵ��200������
m=4200;
train=zeros(m,3);%ѵ�����ݼ���
X=[19 23 14];%��ֵ����
for i=1:m
    for j=1:3
        Mu=X(1,j);
        Sigma=0.5;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
xlswrite('ProduceActuralDistributeData.xls',train);%����д��excel��񱣴�