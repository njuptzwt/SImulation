%第一次初始化就可以了，训练样本集合
%[train]=Initial(200);
[train]=xlsread('data.xls');
[FPC,Mu,dmax]=Train(train);
x=zeros(1,10);
y=zeros(1,10);
%画错误数据率和检错率的图像
for i=10:10:100
[falserate,Detectionrate,falsealarmrate,result]=Test(FPC,Mu,dmax,200,i);
x(i/10)=falserate;
y(i/10)=Detectionrate;
end
plot(x,y,'-*');
axis([0 0.35 0 1]);
title('DR VS FR');%加图形标题
xlabel('falserate');%加X轴说明
ylabel('Detectionrate');%加Y轴说明
% text(0.8,1.5,'曲线y1=2e^{-0.5x}');%在指定位置添加图形说明
% text(2.5,1.1,'曲线y2=cos(4{\pi}x)');
grid on;
legend('DR');%加图例