function [  ] = DrawTrainAndTest(  )
[dmax,Mediandmax,Mu,FPC,DistributeTrain]=PCADistributedTraining();
x=DistributeTrain(1:400,1);
y=DistributeTrain(1:400,2);
z=DistributeTrain(1:400,3);
%画错误数据率和检错率的图像
[falserate,Detectionrate,falsealarmrate,result,test]= DistributeDetectionRate(Mu,dmax,FPC,Mediandmax,200,50);%测试数据不应该这么大，每个节点的训练样本600个
x1=test(1:200,1);
y1=test(1:200,2);
z1=test(1:200,3);
x2=test(201:250,1);
y2=test(201:250,2);
z2=test(201:250,3);
subplot(1,2,1);
scatter3(x,y,z,'b','.');%数据集合的空间分布图形
subplot(1,2,2)
scatter3(x1,y1,z1,'b','.');
hold on;
scatter3(x2,y2,z2,'r','*');