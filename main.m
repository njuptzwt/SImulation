%��һ�γ�ʼ���Ϳ����ˣ�ѵ����������
%[train]=Initial(200);
[train]=xlsread('data.xls');
[FPC,Mu,dmax]=Train(train);
x=zeros(1,10);
y=zeros(1,10);
%�����������ʺͼ���ʵ�ͼ��
for i=10:10:100
[falserate,Detectionrate,falsealarmrate,result]=Test(FPC,Mu,dmax,200,i);
x(i/10)=falserate;
y(i/10)=Detectionrate;
end
plot(x,y,'-*');
axis([0 0.35 0 1]);
title('DR VS FR');%��ͼ�α���
xlabel('falserate');%��X��˵��
ylabel('Detectionrate');%��Y��˵��
% text(0.8,1.5,'����y1=2e^{-0.5x}');%��ָ��λ�����ͼ��˵��
% text(2.5,1.1,'����y2=cos(4{\pi}x)');
grid on;
legend('DR');%��ͼ��