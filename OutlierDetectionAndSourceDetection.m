function [ ] =OutlierDetectionAndSourceDetection(testdata,Mu,FPC,Mediandmax,dmax)
%UNTITLED4 此处显示有关此函数的摘要
%异常检测方法和事件源检测
[m,n]=size(testdata);
di=zeros(1,7);
flag=0;%错误数据判断
sourceflag=-1;%事件源判断
for i=1:m
s1=testdata(i,:)-Mu(i,:);
d1=norm(s1,2);
d2=s1*FPC(:,i);
di(1,i)=sqrt(d1.^2-d2.^2);
end
Mediandi=median(di');
%判断是否是Outlier
if(di(1,1)>dmax(1,1)&& di(1,1)>Mediandmax)
    flag=1;
%判断事件源属性
if(Mediandi>Mediandmax)
    sourceflag=1;
end
end
%最终判决
if(flag>0 && sourceflag>0)
    disp('这是一个错误事件');
elseif(flag>0 && sourceflag<0)
    disp('这是一个错误数据');
else
    disp('这是一个正常数据');
end
end

