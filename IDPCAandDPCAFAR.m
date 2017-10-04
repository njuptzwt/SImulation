function [Detectionrate,falsealarmrate,result]= IDPCAandDPCAFAR(Mu,dmax,FPC,Mediandmax,correct,false,control)
Fcount=0;
Dcount=0;
test=ones(correct+false,3);%�����������������ݺ��쳣���ݹ���
result=ones(1,correct+false);%��֤����Ϊ1��û�д����ʱ��
X=[0.3 0.35 0.4];%��ֵ����
%������������
for i=1:correct
    for j=1:3
        mu=X(randperm(3,1));
        Sigma=0.041-0.001*control;%���ʣ���Ȼ�ǳ�С
        test(i,j)=normrnd(mu,Sigma);
    end
    %���㵽��һ���ɷֵľ���
    s1=test(i,:)-Mu(1,:);
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ��ϣ��͵�һ��group�ڵ���Ϊ�Ƚ϶���
    if(di<=dmax(1,1))
        result(1,i)=1;
    elseif(di>Mediandmax)%������ݴ���dmax�����ݴ���MedianMax
        result(1,i)=0;
        Fcount=Fcount+1;
    end
end
falsealarmrate=(Fcount/correct)*100

%���ĳ�������쳣������
for i=correct+1:correct+false
    for j=1:2
        mu=X(randperm(3,1));
        Sigma=0.03;%��������
        test(i,j)=normrnd(mu,Sigma);
    end
    test(i,3)=unifrnd(0.5,1);%�쳣����,��ֵ�ֲ�
    s1=test(i,:)-Mu(1,:);
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ���
    if(di<=dmax(1,1))
        result(1,i)=1;%��������
    elseif(di>Mediandmax)
        result(1,i)=0;
        Dcount=Dcount+1;%��������Ǵ���ĸ���
    end
end
Detectionrate=(Dcount/false)*100
end