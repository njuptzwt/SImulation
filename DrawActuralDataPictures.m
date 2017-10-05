function [  ] = DrawActuralDataPictures(  )
%参数一定要对应好，否则很容易出错！
[dmax,Mediandmax,Mu,FPC,DistributeTrain,Compare]=PCAActuralDistributed();
x=zeros(1,50);
y=zeros(1,50);
z=zeros(1,50);
%画错误数据率和检错率的图像
for i=1:50
[falserate,Detectionrate,falsealarmrate,result]= ActuralDistributeDetectionRate(Mu,dmax,FPC,Mediandmax,Compare,600,100);%测试数据不应该这么大，每个节点的训练样本600个
x(i)=i;
y(i)=Detectionrate*100;
z(i)=falsealarmrate*100;
end
y=round(y);
z=round(z);
subplot(2,1,1);
plot(x,y,'-.k','linewidth',1,'Markersize',5);
%plot(x,z,'-#');
axis([1 50 90 100]);
% title('DR VS Time Wiindows');%加图形标题
% xlabel('Time Windows');%加X轴说明
ylabel('DetectionRate(%)');%加Y轴说明
hold on
subplot(2,1,2);
plot(x,z,'-*k','linewidth',1,'Markersize',5);
axis([1 50 0 5]);
% title('FNR VS Time Windows');%加图形标题
xlabel('Time Windows');%加X轴说明
ylabel('Falsealarmrate(%)');%加Y轴说明
end