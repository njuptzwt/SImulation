function [  ] = DrawActuralDataPictures(  )
%����һ��Ҫ��Ӧ�ã���������׳���
[dmax,Mediandmax,Mu,FPC,DistributeTrain,Compare]=PCAActuralDistributed();
x=zeros(1,50);
y=zeros(1,50);
z=zeros(1,50);
%�����������ʺͼ���ʵ�ͼ��
for i=1:50
[falserate,Detectionrate,falsealarmrate,result]= ActuralDistributeDetectionRate(Mu,dmax,FPC,Mediandmax,Compare,600,100);%�������ݲ�Ӧ����ô��ÿ���ڵ��ѵ������600��
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
% title('DR VS Time Wiindows');%��ͼ�α���
% xlabel('Time Windows');%��X��˵��
ylabel('DetectionRate(%)');%��Y��˵��
hold on
subplot(2,1,2);
plot(x,z,'-*k','linewidth',1,'Markersize',5);
axis([1 50 0 5]);
% title('FNR VS Time Windows');%��ͼ�α���
xlabel('Time Windows');%��X��˵��
ylabel('Falsealarmrate(%)');%��Y��˵��
end