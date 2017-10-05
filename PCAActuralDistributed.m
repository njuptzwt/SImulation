function [dmax,Mediandmax,Mu,FPC,DistributeTrain,Compare] =PCAActuralDistributed()
%��߿��Լ�һ���������κε���ֵ���ڵ�ǰmax+min�Զ��ж�Ϊ��������
%   �˴���ʾ��ϸ˵��
[train]=xlsread('ProduceActuralDistributeData.xls');
x=train(:,1);
y=train(:,2);
z=train(:,3);
Compare=zeros(7,3);
dmax=zeros(1,7);
Mu=zeros(7,3);%ÿһ���ڵ㶼�о�ֵ��������ֵ
FPC=zeros(3,7);%ÿһ���ڵ��������ɷַ���
for i=1:7
  DistributeTrain=train(600*(i-1)+1:600*i,:);
  Compare(i,:)=min(DistributeTrain)+max(DistributeTrain);%��һ���Ƚϵ�ʱ������
  DistributeTrain=DistributeTrain./(min(DistributeTrain)+max(DistributeTrain));%��׼������
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