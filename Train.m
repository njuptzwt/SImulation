function [FPC,Mu,dmax] = Train(train)
%�����������ѵ����֪�����������õ����ľ�����ֵdMax
%������Ҫ�����ݽ��б�׼������֮��ʹ��PCA���ɷַ����ķ���������һ���ɷ֣�������ľ���ֵ
mu=mean(train); 
Mu=mu;
train_norm=bsxfun(@minus,train, mu);  
sigma=std(train_norm);  
train_norm=bsxfun(@rdivide, train_norm, sigma);  
X=train_norm; % just for convience  
[m,n]=size(X);
d=zeros(1,m);
U=zeros(n);%U����������������
S=zeros(n);%S��������ֵ�ԽǾ���
Cov=1/m *(X'*X);%Э�������
[U,S,V]=svd(Cov); %����ֵ�ֽ������������
FPC=U(:,1);
%��������������ֵ����һ���ɷ�������ľ���
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

