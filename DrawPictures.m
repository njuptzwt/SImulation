function [  ] = DrawPictures(  )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[dmax,Mediandmax,Mu,FPC]=PCADistributedTraining();
x=zeros(1,10);
y=zeros(1,10);
z=zeros(1,10);
%�����������ʺͼ���ʵ�ͼ��
for i=10:10:100
[falserate,Detectionrate,falsealarmrate,result]= DistributeDetectionRate(Mu,dmax,FPC,Mediandmax,100,i);%�������ݲ�Ӧ����ô��ÿ���ڵ��ѵ��������200��
x(i/10)=falserate;
y(i/10)=Detectionrate;
z(i/10)=falsealarmrate;
end
subplot(2,1,1);
plot(x,y,'-d','linewidth',1,'Markersize',5);
%plot(x,z,'-#');
axis([0 0.5 0.5 1]);
grid on;
title('DR VS FR');%��ͼ�α���
xlabel('falserate');%��X��˵��
ylabel('DetectionRate');%��Y��˵��
hold on
subplot(2,1,2);
plot(x,z,'r-p','linewidth',1,'Markersize',10);
axis([0 0.5 0 0.1]);
grid on;
title('FNR VS FR');%��ͼ�α���
xlabel('falserate');%��X��˵��
ylabel('Falsealarmrate');%��Y��˵��
% title('DR and FNR VS FR');%��ͼ�α���
% xlabel('falserate');%��X��˵��
% ylabel('Detectionrate');%��Y��˵��
% % text(0.8,1.5,'����y1=2e^{-0.5x}');%��ָ��λ�����ͼ��˵��
% % text(2.5,1.1,'����y2=cos(4{\pi}x)');
% legend('DR');%��ͼ��
end

