function [train]= Initial(m)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%��ʼ����Ҫ�˹���ϵ����ݣ�����ȡ�Ծ�ֵΪ��0.3��0.35��0.4������Ϊ0.03�ģ���˹�ֲ������ݼ��ϡ���Щ���ǵ�һ�γ�ʼ���ɵĻ�
m=500;
train=zeros(m,3);%ѵ�����ݼ���
X=[0.3 0.35 0.4];%��ֵ����
for i=1:m
    for j=1:3
        Mu=X(randperm(3,1));
        Sigma=0.03;
        train(i,j)=normrnd(Mu,Sigma);
    end
end
%���ݼ��ϵĿռ�ֲ����
x=train(:,1);
y=train(:,2);
z=train(:,3);
%xlswrite('data.xls',train);%����д��excel��񱣴�
scatter3(x,y,z,'b','.');%���ݼ��ϵĿռ�ֲ�ͼ��
%grid on
end

