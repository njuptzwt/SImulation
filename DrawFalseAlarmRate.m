function [  ] = DrawFalseAlarmRate(  )
[dmax,Mediandmax,Mu,FPC]=PCADistributedTraining();
x=zeros(1,11);
y=zeros(1,11);%IDPCA
y1=[4.91,4.67,4.36,4.13,3.96,3.75,3.56,3.44,3.40,3.31,3.26];%DPCA
y2=[3.73,3.39,3.11,2.93,2.81,2.66,2.45,2.35,2.27,2.20,2.16];
for i=1:11
[Detectionrate,falsealarmrate,result]= IDPCAandDPCAFAR(Mu,dmax,FPC,Mediandmax,500,100,i);%测试数据不应该这么大，每个节点的训练样本600个
x(i)=(i-1)*4;
y(i)=falsealarmrate;
end
plot(x,y,'-ok','linewidth',1);
hold on
plot(x,y1,'-*k','linewidth',1);
hold on
plot(x,y2,'-.k','linewidth',1);
axis([0 40 0 7]);
xlabel('False Rate');%加X轴说明
ylabel('False Alarm Rate (%)');%加Y轴说明
hold on
end
