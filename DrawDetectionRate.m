function [ ]=DrawDetectionRate()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[dmax,Mediandmax,Mu,FPC]=PCADistributedTraining();
x=zeros(1,50);
y=zeros(1,50);%IDPCA
z=zeros(1,50);
y1=[96,95,94,97,94,95,96,95,93,95,93,94,94,96,93,94,95,94,94,96,94,95,95,96,96,96,96,96,95,95,95,94,96,95,94,94,94,94,94,96, 93,94,94,94,94,96,96,97,95,94];%DPCA
y2=[96,96,95,96,94,95,96,96,93,94,94,94,94,96,93,94,95,94,94,95,94,94,96,95,96,96,96,96,96,95,95,94,95,94,94,94,94,94,94,97,93,94,94,95,94,95,96,95,94,94];%CPCA
%画错误数据率和检错率的图像
for i=1:50
[Detectionrate,falsealarmrate,result]= IDPCAandDPCADR(Mu,dmax,FPC,Mediandmax,400,1000);%测试数据不应该这么大，每个节点的训练样本600个
x(i)=i;
y(i)=Detectionrate;
z(i)=falsealarmrate;
end
y=round(y);
z=round(z);
%subplot(2,1,1);
plot(x,y,'-ok','linewidth',1);
hold on
plot(x,y1,'-*k','linewidth',1);
hold on
plot(x,y2,'-.k','linewidth',1);
%plot(x,z,'-#');
axis([1 50 90 100]);
xlabel('TimeWindows');%加X轴说明
ylabel('Detection Rate (%)');%加Y轴说明
hold on
%subplot(2,1,2);
% plot(x,z,'r-p','linewidth',1,'Markersize',10);
% axis([0 50 0 5]);
% grid on;
% xlabel('timewidows');%加X轴说明
% ylabel('Falsealarm rate (%)');%加Y轴说明
end
