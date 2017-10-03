function [ ] =OutlierDetectionAndSourceDetection(testdata,Mu,FPC,Mediandmax,dmax)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%�쳣��ⷽ�����¼�Դ���
[m,n]=size(testdata);
di=zeros(1,7);
flag=0;%���������ж�
sourceflag=-1;%�¼�Դ�ж�
for i=1:m
s1=testdata(i,:)-Mu(i,:);
d1=norm(s1,2);
d2=s1*FPC(:,i);
di(1,i)=sqrt(d1.^2-d2.^2);
end
Mediandi=median(di');
%�ж��Ƿ���Outlier
if(di(1,1)>dmax(1,1)&& di(1,1)>Mediandmax)
    flag=1;
%�ж��¼�Դ����
if(Mediandi>Mediandmax)
    sourceflag=1;
end
end
%�����о�
if(flag>0 && sourceflag>0)
    disp('����һ�������¼�');
elseif(flag>0 && sourceflag<0)
    disp('����һ����������');
else
    disp('����һ����������');
end
end

