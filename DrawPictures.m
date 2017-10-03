function [  ] = DrawPictures(  )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[dmax,Mediandmax,Mu,FPC]=PCADistributedTraining();
x=zeros(1,10);
y=zeros(1,10);
z=zeros(1,10);
%画错误数据率和检错率的图像
for i=10:10:100
[falserate,Detectionrate,falsealarmrate,result]= DistributeDetectionRate(Mu,dmax,FPC,Mediandmax,100,i);%测试数据不应该这么大，每个节点的训练样本才200个
x(i/10)=falserate;
y(i/10)=Detectionrate;
z(i/10)=falsealarmrate;
end
subplot(2,1,1);
plot(x,y,'-d','linewidth',1,'Markersize',5);
%plot(x,z,'-#');
axis([0 0.5 0.5 1]);
grid on;
title('DR VS FR');%加图形标题
xlabel('falserate');%加X轴说明
ylabel('DetectionRate');%加Y轴说明
hold on
subplot(2,1,2);
plot(x,z,'r-p','linewidth',1,'Markersize',10);
axis([0 0.5 0 0.1]);
grid on;
title('FNR VS FR');%加图形标题
xlabel('falserate');%加X轴说明
ylabel('Falsealarmrate');%加Y轴说明
% title('DR and FNR VS FR');%加图形标题
% xlabel('falserate');%加X轴说明
% ylabel('Detectionrate');%加Y轴说明
% % text(0.8,1.5,'曲线y1=2e^{-0.5x}');%在指定位置添加图形说明
% % text(2.5,1.1,'曲线y2=cos(4{\pi}x)');
% legend('DR');%加图例
end

