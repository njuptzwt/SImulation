function [dmax,Mediandmax,Mu,FPC,DistributeTrain] =PCADistributedTraining()
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[train]=xlsread('ProduceDistributeData.xls');
x=train(:,1);
y=train(:,2);
z=train(:,3);
%xlswrite('data.xls',train);%����д��excel��񱣴�
scatter3(x,y,z,'b','.')%���ݼ��ϵĿռ�ֲ�ͼ��
%grid on
dmax=zeros(1,7);
Mu=zeros(7,3);%ÿһ���ڵ㶼�о�ֵ��������ֵ
FPC=zeros(3,7);%ÿһ���ڵ��������ɷַ���
for i=1:7
  DistributeTrain=train(600*(i-1)+1:600*i,:);
mu=mean(DistributeTrain);%��ÿһ���ڵ�������ľ�ֵ
Mu(i,:)=mu;
DistributeTrain_norm=bsxfun(@minus,DistributeTrain, mu);  
sigma=std(DistributeTrain_norm);  
DistributeTrain_norm=bsxfun(@rdivide, DistributeTrain_norm, sigma);  
X=DistributeTrain_norm; % ���׼����ľ���  
[m,n]=size(X);
d=zeros(1,m);%ÿһ����������һ���ɷֵ�ֵ
U=zeros(n);%U����������������
S=zeros(n);%S��������ֵ�ԽǾ���
Cov=1/m *(X'*X);%Э������󣬸��Ӷ�n*p^2
[U,S,V]=svd(Cov); %����ֵ�ֽ������������,���Ӷ�p^3,һ�������n>p
FPC(:,i)=U(:,1);%����һ���ɷ֣���������
%��������������ֵ����һ���ɷ�������ľ���
for j=1:m
    s1=DistributeTrain(j,:)-mu;
    d1=norm(s1,2);%���������Ķ�������б�߳�
    d2=s1*FPC(:,i);%ֱ�Ǳ߳����ص�һ���ɷַ���
    dj=sqrt(d1.^2-d2.^2);%����һ���ɷֵ���������
    d(1,j)=dj;
end
%������ֵ����
dmax(1,i)=max(d);%���ÿһ���ڵ��������ֵ
end
Mediandmax=median(dmax');%�м�ڵ��Global�����ֵ
end

